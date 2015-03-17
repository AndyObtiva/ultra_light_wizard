class WizardStepsController < ApplicationController
  include Steppable
  before_filter :authenticate_user!, :authorize_project, :load_wizard_type
  layout 'backend'
  include ProjectsHelper

  WIZARDS = {
    'new' => ['basic_info', 'detail', 'document_content', 'preview']
  }
  WIZARDS.merge!('edit' => ['basics','online_presence','overview','media', 'documents', 'timeline', 'executives', 'financial_terms'])

  WIZARD_STEP_REGEX = /^([^_]+)_(.+)$/

  def edit
    if @project.editable? || current_user.is_admin?
      if WIZARDS[@wizard].to_a.include?(step)
        add_event_log("business questionaire step viewed", @project.id, step)
        wizard = @wizard == 'new' ? 'application' : 'edit_offering'
        log_ga_event('offerings', wizard, step)
        render params[:id]
      else
        render "#{Rails.root.to_s}/public/404.html", :layout => false, :status => 404
      end
    else
      redirect_to :back, :alert => I18n.t("project.#{@project.status}_editable_error")
    end
  end

  def update
    if @project.update_attributes(params[:project])
      current_step_index = WIZARDS[@wizard].index(step)
      next_step = WIZARDS[@wizard][current_step_index+1]
      if next_step && (params[:project].nil? || params[:commit].downcase.include?('continue'))
        redirect_to edit_project_wizard_step_path(@project, "#{@wizard}_#{next_step}")
      else
        redirect_to project_path(@project)
      end
    else
      render params[:id], :error => "Please complete all required fields"
    end
  end

  private

  def authorize_project
    @project = wizard_step_project
    if @project.user_id != current_user.id && !current_user.is_admin?
      render(:file => "#{Rails.root.to_s}/public/403.html", :layout => false, :status => 403)
    end
  end

  def wizard_step_project
    "Project::#{step.camelcase}".constantize.find(params[:project_id]) rescue Project.find(params[:project_id])
  end

  def step
    params[:id].match(WIZARD_STEP_REGEX)[2]
  end

  def load_wizard_type
    @wizard = params[:id].match(WIZARD_STEP_REGEX)[1]
  end
end
