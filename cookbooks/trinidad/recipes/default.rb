#
# Cookbook Name:: trinidad
# Recipe:: default
#

if [:solo, :app_master, :app].include?(node[:role])
  node[:applications].each do |app_name, data|
    # restart trinidad
    execute "restart-#{app_name}" do
      command "monit restart trinidad_#{app_name}"
      action :nothing
    end
  
    # read trinidad_base.yml
    base = YAML.load_file("/data/#{app_name}/shared/config/trinidad_base.yml")

    # trinidad.yml
    template "/data/#{app_name}/shared/config/trinidad.yml" do
      source 'trinidad.yml.erb'
      owner node[:owner_name]
      group node[:owner_name]
      mode 0644
      backup false
      variables({
        :min_runtimes => base['jruby_min_runtimes'],
        :max_runtimes => base['jruby_max_runtimes']
      })
      notifies :run, resources(:execute => "restart-#{app_name}"), :delayed
    end
  
    # env.custom
    template "/data/#{app_name}/shared/config/env.custom" do
      source 'env.custom.erb'
      owner node[:owner_name]
      group node[:owner_name]
      mode 0644
      backup false
      variables({
        :app_name => app_name
      })
      notifies :run, resources(:execute => "restart-#{app_name}"), :delayed
    end
  end
end
