source 'https://rubygems.org'
ruby "2.2.2"

gem 'rack-cors'
gem 'pg'
gem 'activerecord', '~> 4.0.0', :require => 'active_record'
gem 'hashie-forbidden_attributes'
gem 'honeybadger', '~> 1.16.7'
gem 'json'
gem 'napa', github: 'ashtonthomas/napa', branch: 'chi_winery'
gem 'grape', '~> 0.13.0'

gem 'roar', '~> 0.12.0'

gem 'grape-swagger'

gem 'representable', '>= 2.4.0.rc1'


# api_client stuff
gem 'faraday'
gem 'faraday_middleware'
gem 'celluloid'
gem 'celluloid-io'
gem 'imprint'

gem 'puma', '2.11.3' # fixing version because the 2.12 revision has problems reporting to NewRelic

gem 'naught'

group :development,:test do
  gem 'pry'
end

group :development do
  gem 'rubocop', require: false
  gem 'shotgun', require: false
end

group :test do
  gem 'factory_girl'
  gem 'rspec'
  gem 'rack-test'
  gem 'simplecov'
  gem 'webmock'
  gem 'database_cleaner'
end
