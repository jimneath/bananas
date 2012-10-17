source 'http://rubygems.org'

platforms :mri, :rbx do
  gem 'pg'
  gem 'puma'
end

platforms :jruby do 
  gem 'jruby-openssl' 
  gem 'puma'
  gem 'activerecord-jdbc-adapter' 
  gem 'jdbc-postgres', :require => false 
end 

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'rails', '3.2.8'
gem 'json'
gem 'jquery-rails'
gem 'newrelic_rpm'
gem 'i18n', '0.6.1'

# resque scheduler - CC-78
gem 'resque'
gem 'resque-scheduler', :require => 'resque_scheduler'

# turbo sprockets - ZD 50472
gem 'turbo-sprockets-rails3'
gem 'bootstrap-sass'
gem "rails-backbone"