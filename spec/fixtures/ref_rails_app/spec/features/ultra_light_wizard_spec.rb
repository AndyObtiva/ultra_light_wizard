require_relative '../rails_helper'

RSpec.feature "Ultra Light Wizard", type: :feature do
  scenario 'can start wizard' do
    visit '/projects'
    click_link 'New Project'

    save_and_open_page
  end
  scenario 'can input all 4 fields and go to step 2 in wizard'
  scenario 'can go back to step 1 in wizard'
  scenario 'can input all 4 fields and go to step 3 in wizard'
  scenario 'can go back to step 2 in wizard'
  scenario 'can input all 4 fields and go to step 4 in wizard'
  scenario 'can go back to step 3 in wizard'
  scenario 'can finish wizard and land on show page of model'
end
