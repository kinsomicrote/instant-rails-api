# frozen_string_literal: true

def source_paths
  [__dir__]
end

def instant_rails_api_file(filename, content)
  file(filename, content: true)
end

instant_rails_api_file "config/initializers/generators.rb", <<-CODE
Rails.application.config.generators do |g|
  g.helper false
  g.serializer false

  g.test_framework :rspec,
                   fixtures: false,
                   helper_specs: false,
                   routing_specs: false,
                   request_specs: false
end
CODE

add_devise_gem = yes?('Would you like to add Devise gem? - yes/no')
if add_devise_gem
  gem "devise_token_auth"
end

gem "rack-cors"
gem "rack-mini-profiler"

after_bundle do
  if add_devise_gem && yes?('Would you like to install Devise? - yes/no')
    model_name = ask('What would you like the user model to be called? [User]')
    model_name = "User" if model_name.blank?
    rails_command("generate devise:install")
    rails_command("db:setup")
    rails_command("generate devise_token_auth:install #{model_name} auth")
    rails_command("db:migrate")
  end
end

gem_group :development, :test do
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "standard"
  gem "prosopite"
end
