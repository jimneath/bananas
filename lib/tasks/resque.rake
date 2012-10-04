require 'resque/tasks'
require 'resque_scheduler/tasks'
require 'resque/scheduler'

namespace :resque do
  task :setup => :environment do
    Resque.schedule = YAML.load_file(Rails.root.join('config/schedule.yml'))
  end
end