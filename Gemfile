source 'http://rubygems.org'

platforms :jruby do 
  gem 'jruby-openssl' 
  gem 'trinidad'
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
gem 'i18n', '0.6.1'

# resque scheduler - CC-78
gem 'resque'
gem 'resque-scheduler', :require => 'resque_scheduler'