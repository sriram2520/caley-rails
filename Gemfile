source "https://rubygems.org"

ruby "3.3.0"

# Rails
gem "rails", github: "rails/rails", branch: "main"

# Drivers
gem "pg", "~> 1.5"
gem "redis", ">= 4.0.1"

# Deployment
gem "puma", ">= 5.0"
gem "bootsnap", require: false

# Assets
gem "importmap-rails"
gem "propshaft"
gem "tailwindcss-rails"
gem "lucide-rails", github: "maybe-finance/lucide-rails"

# Hotwire
gem "stimulus-rails"
gem "turbo-rails"

# Other
gem "bcrypt", "~> 3.1.7"
gem "inline_svg"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "money-rails", "~> 1.12"
gem "net-imap"
gem "devise"

gem "strong_migrations"

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "brakeman", require: false
  gem "standard"
  gem "dotenv-rails"
  gem "letter_opener"
  gem "i18n-tasks"
  gem "faker"
end

group :development do
  gem "web-console"
  gem "hotwire-livereload"
  gem "ruby-lsp-rails"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
