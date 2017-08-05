require 'spec_helper'
require 'fileutils'

describe UltraLightWizard do
  let(:app_rails_ref) {File.expand_path(File.join(__FILE__, '..', '..', '..', 'fixtures', 'ref_rails_app'))}
  let(:app_rails_copy) {app_rails_ref.sub('ref', 'copy')}
  before do
    FileUtils.rm_rf app_rails_copy
    FileUtils.cp_r app_rails_ref, app_rails_copy
  end
  after do
    FileUtils.rm_rf app_rails_copy
  end
  it 'provides a rails generator when installed in a sample Rails app' do
    result = system "cd #{app_rails_copy}
    rake db:reset
    rails generate ultra_light_wizard:scaffold project steps:basic_info,detail,file_upload,preview attributes:name:string,description:text,start_date:datetime,delivery_date:datetime
    rake db:migrate
    rake db:test:prepare
    rake"
    expect(result).to be_truthy
  end
end
