module UltraLightWizard
  module Generators
    class ResourceGenerator < Rails::Generators::NamedBase
      #Begin (copied from rails/railties/lib/rails/generators/rails/resource/resource_generator.rb)
      include ResourceHelpers

      hook_for :resource_controller, :required => true do |controller|
        invoke controller, [ controller_name, options[:actions] ]
      end

      class_option :actions, :type => :array, :banner => "ACTION ACTION", :default => [],
                   :desc => "Actions for the resource controller"

      hook_for :resource_route, :required => true
      #End

      #Begin (copied from rails/railties/lib/rails/generators/rails/model/model_generator.rb)
      argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"
      hook_for :orm, :required => true
      #End

      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a configuration file for a specific application context (e.g. admin). Takes context path as argument (e.g. admin or internal/wiki) to create config/features/[context_path].yml"
      def copy_config
        template "config/features.yml", "config/features/#{file_path}.yml"
      end

    end
  end
end
