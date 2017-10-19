# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: nkss-rails 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nkss-rails".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rico Sta. Cruz".freeze, "Nadarei, Inc.".freeze, "Steven Weller".freeze]
  s.date = "2017-10-19"
  s.description = "Nkss-rails is a drop-in, easy-to-use, gorgeous-by-default Rails plugin you can put into your projects so you can instantly have cute docs.".freeze
  s.email = ["thijs@80beans.com".freeze]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Makefile",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/assets/javascripts/modernizr.js",
    "app/assets/stylesheets/styleguide.sass",
    "app/controllers/styleguides_controller.rb",
    "app/helpers/styleguide_helper.rb",
    "app/views/layouts/styleguide.html.erb",
    "app/views/layouts/styleguide_page.html.erb",
    "app/views/styleguides/_block.html.erb",
    "app/views/styleguides/_specimen.html.erb",
    "app/views/styleguides/_swatch.html.erb",
    "app/views/styleguides/all.html.erb",
    "config/routes.rb",
    "lib/generators/nkss/install_generator.rb",
    "lib/generators/templates/1.html.erb",
    "lib/generators/templates/example-for-styleguides.css",
    "lib/generators/templates/styleguide-extras.css",
    "lib/generators/templates/styleguide-extras.scss",
    "lib/generators/templates/styleguide.html.erb",
    "lib/generators/templates/styleguides.yml",
    "lib/nkss.rb",
    "lib/nkss/engine.rb",
    "lib/nkss/rails.rb",
    "nkss-rails.gemspec",
    "spec/dummy/README.rdoc",
    "spec/dummy/Rakefile",
    "spec/dummy/app/assets/images/.keep",
    "spec/dummy/app/assets/javascripts/application.js",
    "spec/dummy/app/assets/stylesheets/application.css",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/controllers/concerns/.keep",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/mailers/.keep",
    "spec/dummy/app/models/.keep",
    "spec/dummy/app/models/concerns/.keep",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/bin/bundle",
    "spec/dummy/bin/rails",
    "spec/dummy/bin/rake",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/filter_parameter_logging.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/initializers/wrap_parameters.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/test.sqlite3",
    "spec/dummy/lib/assets/.keep",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/favicon.ico",
    "spec/helpers/styleguide_helper_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/nedap/nkss-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Create pretty styleguides for your Rails project.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<kss>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<ffaker>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<BlueCloth>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
      s.add_development_dependency(%q<gemfury>.freeze, [">= 0"])
    else
      s.add_dependency(%q<kss>.freeze, [">= 0"])
      s.add_dependency(%q<ffaker>.freeze, [">= 0"])
      s.add_dependency(%q<BlueCloth>.freeze, [">= 0"])
      s.add_dependency(%q<rails>.freeze, [">= 0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
      s.add_dependency(%q<gemfury>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<kss>.freeze, [">= 0"])
    s.add_dependency(%q<ffaker>.freeze, [">= 0"])
    s.add_dependency(%q<BlueCloth>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.3.7"])
    s.add_dependency(%q<gemfury>.freeze, [">= 0"])
  end
end

