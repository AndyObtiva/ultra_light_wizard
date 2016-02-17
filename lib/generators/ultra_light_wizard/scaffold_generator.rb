module UltraLightWizard
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)
      def arguments
        args.inject({}) do |output, arg|
          # Accommodate argument values containing colon by matching against
          # occurance of it only
          arg_parts = arg.match(/^([^:]+)\:(.+)$/)
          output.merge(arg_parts[1] => arg_parts[2])
        end
      end

      def step_alias
        arguments['step_alias'] || 'step'
      end

      def steps
        arguments['steps'].to_s.split(',').map(&:strip)
      end

      def controller_class_name
        file_path.pluralize.titleize
      end

      def orm_class
        file_path.camelize.titleize
      end

      def index_helper
        file_path.pluralize
      end

      def model_attributes
        arguments['attributes']
      end

      def hashed_model_attributes
        model_attributes.split(',').inject({}) do |output, pair|
          split_pair = pair.split(':')
          output.merge(split_pair.first => split_pair.last)
        end
      end

      def attributes_names
        hashed_model_attributes.keys
      end

      def scaffold_attributes
        model_attributes.gsub(',', ' ')
      end

      def controller_attribute_names
        hashed_model_attributes.keys.map {|key| "\"#{key}\""}.join(', ')
      end

      def human_name
        file_path.humanize
      end

      def plural_table_name
        file_path.pluralize
      end

      def arg_options
        options.select {|key, value| value}.map {|key, value| "--#{key}"}.join(' ')
      end

      def form_content(execute=false)
        if execute #prevents thor from executing too early
          @form_content ||= lambda {
            # TODO support formats other than html.erb like html.haml (autodetect)
            scaffold_form_lines = File.new(Rails.root.join('app', 'views', plural_table_name, '_form.html.erb')).readlines
            form_start_index = scaffold_form_lines.find_index {|line| line.include?('form')}
            form_end_index =  scaffold_form_lines.length - 1 - scaffold_form_lines.reverse.find_index {|line| line.include?('actions')}
            form_content_start_index = form_start_index + 1
            form_content_end_index = form_end_index - 1
            extracted_form_lines = scaffold_form_lines[form_content_start_index..form_content_end_index]
            extracted_form_lines.join
          }.()
        end
      end

      desc "Creates a configuration file for a specific application context (e.g. admin). Takes context path as argument (e.g. admin or internal/wiki) to create config/features/[context_path].yml"
      def copy_config
        generate "scaffold", "#{file_path} #{scaffold_attributes} #{arg_options}"

        gsub_file "app/controllers/#{file_path.pluralize}_controller.rb",
          "@#{singular_table_name}.save\n",
          "@#{singular_table_name}.save(validation: false)\n"
        gsub_file "app/controllers/#{file_path.pluralize}_controller.rb",
          "redirect_to @#{singular_table_name}, notice: 'Video was successfully created.'",
          "redirect_to edit_#{file_path}_#{file_path}_#{step_alias}_path(@#{singular_table_name}, #{orm_class}#{step_alias.camelize.titleize.pluralize}Helper::#{step_alias.pluralize.upcase}.first)"
        inject_into_file "app/controllers/#{file_path.pluralize}_controller.rb",
          after: "def #{singular_table_name}_params\n" do
          "      return {} unless params[:#{singular_table_name}].present?\n"
        end
        gsub_file "app/views/#{file_path.pluralize}/index.html.erb",
          "new_#{singular_table_name}_path",
          "#{file_path.pluralize}_path, method: :post"
        template "app/controllers/wizard_steps_controller.rb.erb", "app/controllers/#{file_path}_#{step_alias.pluralize}_controller.rb"
        template "app/helpers/wizard_steps_helper.rb.erb", "app/helpers/#{file_path}_#{step_alias.pluralize}_helper.rb"
        template "app/views/wizard_step_navigation_view.html.erb", "app/views/#{file_path}_#{step_alias.pluralize}/_#{step_alias}_navigation.html.erb"
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
