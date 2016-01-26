module UltraLightWizard
  module Generators
    class WizardGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a configuration file for a specific application context (e.g. admin). Takes context path as argument (e.g. admin or internal/wiki) to create config/features/[context_path].yml"
      def copy_config
        template "app/controllers/wizard_steps_controller.rb.erb", "app/controllers/#{file_path}_steps_controller.rb"
        wizard_route_content = <<-CONTENT
resources :#{plural_file_name}, only: [:create, :show] do
    resources :#{file_path}_steps, only: [:edit, :update]
  end
        CONTENT
        route wizard_route_content
      end
    end
  end
end
