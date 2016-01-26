module UltraLightWizard
  module Generators
    class WizardGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)
      def arguments
        args.inject({}) do |output, arg|
          arg_parts = arg.split(':')
          output.merge(arg_parts.first => arg_parts.last)
        end
      end

      def step_alias
        arguments['step_alias'] || 'step'
      end

      def steps
        arguments['steps'].to_s.split(',').map(&:strip)
      end

      desc "Creates a configuration file for a specific application context (e.g. admin). Takes context path as argument (e.g. admin or internal/wiki) to create config/features/[context_path].yml"
      def copy_config
        template "app/controllers/wizard_steps_controller.rb.erb", "app/controllers/#{file_path}_#{step_alias.pluralize}_controller.rb"
        steps.each do |step|
          @wizard_step = step
          template "app/models/wizard_step_model.rb.erb", "app/models/#{file_path}/#{step}.rb"
          template "app/views/wizard_step_view.html.erb", "app/views/#{file_path}_#{step_alias.pluralize}/#{step}.html.erb"
        end
        wizard_route_content = <<-CONTENT
resources :#{plural_file_name}, only: [:create, :show] do
    resources :#{file_path}_#{step_alias.pluralize}, only: [:edit, :update]
  end
        CONTENT
        routes_content = File.new(Rails.root.join('config', 'routes.rb')).read
        route wizard_route_content unless routes_content.include?(wizard_route_content)
      end
    end
  end
end