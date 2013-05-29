source 'https://rubygems.org'

gem 'rails', '4.0.0.rc1'

# assets
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'compass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', require: 'v8'
gem 'jquery-rails'
gem 'turbo-sprockets-rails3'

# Ember
gem 'ember-rails', git: 'https://github.com/emberjs/ember-rails.git', ref: 'e63ebc6360536b8fbd63521f19cb9fd10433e8d9'
gem 'active_model_serializers', git: 'https://github.com/rails-api/active_model_serializers.git'
gem 'handlebars-source', '>= 1.0.0.rc3'

# S3
gem 'fog', require: false


gem 'sidekiq'
gem 'rake'
gem 'rest-client'
gem 'rinku'
gem 'sanitize'
gem 'diffy', require: false
gem 'has_ip_address'

# Templating
gem 'redcarpet', require: false

# Intercom
gem 'message_bus', github: 'SamSaffron/message_bus'

# Database
gem 'pg'
gem 'activerecord-postgres-hstore'

# crypto fu
gem 'fast_xs'
gem 'fast_xor', git: 'https://github.com/CodeMonkeySteve/fast_xor.git'


gem 'jbuilder', '~> 1.0.1'

group :test do
  gem 'fakeweb', '~> 1.3.0', require: false
  gem 'minitest', require: false
  gem "factory_girl_rails"
  gem "capybara"
  gem "zeus"
end

group :test, :development do
  gem 'jshint_on_rails'
  gem 'listen', require: false
  gem 'guard-jshint-on-rails', require: false
  gem 'certified', require: false
  gem 'fabrication', require: false
  gem 'guard-jasmine', require: false
  gem 'guard-rspec', require: false
  gem 'guard-spork', require: false
  gem "parallel_tests"
  gem "zeus-parallel_tests"
  gem 'jasminerice', github: 'bradphelan/jasminerice' # not compatible with rails 4
  gem 'mocha', require: false
  gem 'rb-fsevent', require: RUBY_PLATFORM =~ /darwin/i ? 'rb-fsevent' : false
  gem 'rb-inotify', '~> 0.9', require: RUBY_PLATFORM =~ /linux/i ? 'rb-inotify' : false
  gem 'rspec-rails'
  gem 'shoulda', require: false
  gem 'simplecov', require: false
  gem 'terminal-notifier-guard', require: false
  gem 'timecop'
  gem 'rspec-given'
  gem 'pry-rails'
  gem 'pry-nav'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'librarian', '>= 0.0.25', require: false
        # https://github.com/ctran/annotate_models/pull/106
  gem 'annotate', :git => 'https://github.com/SamSaffron/annotate_models.git'
end



# Servers
gem 'slim'
gem 'sinatra', require: nil
gem 'thin'

# Rack
gem 'rack-cors', require: false
gem 'rack-mini-profiler', require: false

# Timing
gem 'clockwork', require: false

# Event handling
gem 'em-redis'
gem 'eventmachine'

# cache stuff
gem 'lru_redux'
gem 'redis-rack-cache', git: 'https://github.com/SamSaffron/redis-rack-cache.git', require: false
gem 'rack-cache', require: false
gem 'redis'
gem 'hiredis'

# String#blank? is verrrry slow
gem 'fast_blank'

