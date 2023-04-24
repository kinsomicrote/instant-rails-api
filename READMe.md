# Instant Rails API

### What it is?

I created this to be able to instantly create a new Rails API alongside the necessary gems I need.

### Secondary gems installed.

Aside from the default gems that Rails will install, this template will install the follwing:

```
gem "rack-cors"
gem "rack-mini-profiler"

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
```

### What else?
Conditionally, it can also add a devise gem, install devise, generate a model and finally create and run your migration.

### Prerequisites

You need to have the `rails` gem installed.

### Usage Instructions

Run the following command:

```bash
rails new my_app_name --api \
  -T \
  -d postgresql \
  -m https://raw.githubusercontent.com/kinsomicrote/instant-rails-api/main/template/template.rb
```

## Acknowledgements

This project was inspired by Jason Swett's [Instant Rails](https://github.com/jasonswett/instant_rails)
