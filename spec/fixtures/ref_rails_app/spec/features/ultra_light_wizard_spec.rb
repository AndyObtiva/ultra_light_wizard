require_relative '../rails_helper'

RSpec.feature "Ultra Light Wizard", type: :feature do
  def create_project
    visit '/projects'
    click_link 'New Project'
  end
  def fill_in_project_fields
    fill_in 'project_name', with: 'Project 1'
    fill_in 'project_description', with: 'Description 1'
    select (DateTime.current.year + 1).to_s, from: 'project_start_date_1i'
    select (DateTime.current.year + 2).to_s, from: 'project_delivery_date_1i'
  end
  def submit_project_basic_info
    fill_in_project_fields
    find('input[type=submit]').click
  end
  alias submit_project_detail submit_project_basic_info
  alias submit_project_file_upload submit_project_basic_info
  alias submit_project_preview submit_project_basic_info
  def verify_step(step_class)
    step_name = step_class.name.sub('Project::','').underscore
    expect(page).to have_text(step_name.humanize)
    expect(page).to have_css("form#edit_project[action=\"/projects/#{Project.last.id}/project_steps/#{step_name}\"][method=post]")
  end
  def verify_previous_step_navigatability(step_name)
    expect(page).to have_css("a[href=\"/projects/#{Project.last.id}/project_steps/#{step_name}/edit\"]")
  end
  def verify_project_fields
    expect(page).to have_text("Project 1")
    expect(page).to have_text("Description 1")
    expect(page).to have_text((DateTime.current.year + 1).to_s)
    expect(page).to have_text((DateTime.current.year + 2).to_s)
  end
  scenario 'can start wizard' do
    create_project

    verify_step(Project::BasicInfo)
  end
  scenario 'can input all 4 fields and go to step 2 in wizard' do
    create_project
    submit_project_basic_info

    verify_step(Project::Detail)
    verify_previous_step_navigatability('basic_info')
  end
  scenario 'can input all 4 fields and go to step 3 in wizard' do
    create_project
    submit_project_basic_info
    submit_project_detail

    verify_step(Project::FileUpload)
    verify_previous_step_navigatability('detail')
  end
  scenario 'can input all 4 fields and go to step 4 in wizard' do
    create_project
    submit_project_basic_info
    submit_project_detail
    submit_project_file_upload

    verify_step(Project::Preview)
    verify_previous_step_navigatability('file_upload')
  end
  scenario 'can finish wizard and land on show page of model' do
    create_project
    submit_project_basic_info
    submit_project_detail
    submit_project_file_upload
    submit_project_preview

    expect(page).to have_current_path(project_path(Project.last))
    verify_project_fields
  end
end
