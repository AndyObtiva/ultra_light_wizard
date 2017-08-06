# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: ultra_light_wizard 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "ultra_light_wizard".freeze
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andy Maleh".freeze]
  s.date = "2017-08-06"
  s.description = "Ultra light & maintainble wizards in Rails that honor REST, MVC, and OO with minimal writing of code involved and maximum flexibility".freeze
  s.email = "andy.am@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/generators/templates/app/assets/stylesheets/wizard_steps.scss",
    "lib/generators/templates/app/controllers/wizard_steps_controller.rb.erb",
    "lib/generators/templates/app/helpers/wizard_steps_helper.rb.erb",
    "lib/generators/templates/app/models/wizard_step_model.rb.erb",
    "lib/generators/templates/app/views/wizard_step_breadcrumb_view.html.erb",
    "lib/generators/templates/app/views/wizard_step_navigation_view.html.erb",
    "lib/generators/templates/app/views/wizard_step_view.html.erb",
    "lib/generators/ultra_light_wizard/scaffold_generator.rb",
    "lib/ultra_light_wizard.rb",
    "ruby187.Gemfile",
    "spec/fixtures/ref_rails_app/.gitignore",
    "spec/fixtures/ref_rails_app/Gemfile",
    "spec/fixtures/ref_rails_app/Gemfile.lock",
    "spec/fixtures/ref_rails_app/README.rdoc",
    "spec/fixtures/ref_rails_app/Rakefile",
    "spec/fixtures/ref_rails_app/app/assets/images/.keep",
    "spec/fixtures/ref_rails_app/app/assets/javascripts/application.js",
    "spec/fixtures/ref_rails_app/app/assets/stylesheets/application.css",
    "spec/fixtures/ref_rails_app/app/controllers/application_controller.rb",
    "spec/fixtures/ref_rails_app/app/controllers/concerns/.keep",
    "spec/fixtures/ref_rails_app/app/helpers/application_helper.rb",
    "spec/fixtures/ref_rails_app/app/mailers/.keep",
    "spec/fixtures/ref_rails_app/app/models/.keep",
    "spec/fixtures/ref_rails_app/app/models/concerns/.keep",
    "spec/fixtures/ref_rails_app/app/views/layouts/application.html.erb",
    "spec/fixtures/ref_rails_app/bin/bundle",
    "spec/fixtures/ref_rails_app/bin/rails",
    "spec/fixtures/ref_rails_app/bin/rake",
    "spec/fixtures/ref_rails_app/bin/setup",
    "spec/fixtures/ref_rails_app/bin/spring",
    "spec/fixtures/ref_rails_app/config.ru",
    "spec/fixtures/ref_rails_app/config/application.rb",
    "spec/fixtures/ref_rails_app/config/boot.rb",
    "spec/fixtures/ref_rails_app/config/database.yml",
    "spec/fixtures/ref_rails_app/config/environment.rb",
    "spec/fixtures/ref_rails_app/config/environments/development.rb",
    "spec/fixtures/ref_rails_app/config/environments/production.rb",
    "spec/fixtures/ref_rails_app/config/environments/test.rb",
    "spec/fixtures/ref_rails_app/config/initializers/assets.rb",
    "spec/fixtures/ref_rails_app/config/initializers/backtrace_silencers.rb",
    "spec/fixtures/ref_rails_app/config/initializers/cookies_serializer.rb",
    "spec/fixtures/ref_rails_app/config/initializers/filter_parameter_logging.rb",
    "spec/fixtures/ref_rails_app/config/initializers/inflections.rb",
    "spec/fixtures/ref_rails_app/config/initializers/mime_types.rb",
    "spec/fixtures/ref_rails_app/config/initializers/session_store.rb",
    "spec/fixtures/ref_rails_app/config/initializers/to_time_preserves_timezone.rb",
    "spec/fixtures/ref_rails_app/config/initializers/wrap_parameters.rb",
    "spec/fixtures/ref_rails_app/config/locales/en.yml",
    "spec/fixtures/ref_rails_app/config/routes.rb",
    "spec/fixtures/ref_rails_app/config/secrets.yml",
    "spec/fixtures/ref_rails_app/db/schema.rb",
    "spec/fixtures/ref_rails_app/db/seeds.rb",
    "spec/fixtures/ref_rails_app/lib/assets/.keep",
    "spec/fixtures/ref_rails_app/lib/tasks/.keep",
    "spec/fixtures/ref_rails_app/log/.keep",
    "spec/fixtures/ref_rails_app/public/404.html",
    "spec/fixtures/ref_rails_app/public/422.html",
    "spec/fixtures/ref_rails_app/public/500.html",
    "spec/fixtures/ref_rails_app/public/favicon.ico",
    "spec/fixtures/ref_rails_app/public/robots.txt",
    "spec/fixtures/ref_rails_app/spec/features/ultra_light_wizard_spec.rb",
    "spec/fixtures/ref_rails_app/spec/rails_helper.rb",
    "spec/fixtures/ref_rails_app/spec/spec_helper.rb",
    "spec/fixtures/ref_rails_app/vendor/assets/javascripts/.keep",
    "spec/fixtures/ref_rails_app/vendor/assets/stylesheets/.keep",
    "spec/lib/ultra_light_wizard/ultra_light_wizard_spec.rb",
    "spec/spec_helper.rb",
    "ultra_light_wizard.gemspec",
    "ultra_light_wizard.jpg",
    "ultra_light_wizard_step_breadcrumb.png"
  ]
  s.homepage = "http://github.com/AndyObtiva/ultra_light_wizard".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Ultra Light & Maintainable Wizards In Rails".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<puts_debuggerer>.freeze, ["~> 0.7.1"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 4.2.9"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.6.0"])
      s.add_development_dependency(%q<sass-rails>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<coffee-rails>.freeze, ["~> 4.1.0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
    else
      s.add_dependency(%q<puts_debuggerer>.freeze, ["~> 0.7.1"])
      s.add_dependency(%q<rails>.freeze, ["~> 4.2.9"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.6.0"])
      s.add_dependency(%q<sass-rails>.freeze, ["~> 5.0"])
      s.add_dependency(%q<coffee-rails>.freeze, ["~> 4.1.0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
    end
  else
    s.add_dependency(%q<puts_debuggerer>.freeze, ["~> 0.7.1"])
    s.add_dependency(%q<rails>.freeze, ["~> 4.2.9"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.6.0"])
    s.add_dependency(%q<sass-rails>.freeze, ["~> 5.0"])
    s.add_dependency(%q<coffee-rails>.freeze, ["~> 4.1.0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
  end
end

