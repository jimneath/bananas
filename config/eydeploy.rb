def compile_assets
  roles :app_master, :app, :solo, :util do
    shell.status "Precompiling assets for rails v#{bundled_rails_version}"
    cmd = "cd #{paths.active_release} && PATH=#{paths.binstubs}:$PATH #{config.framework_envs} rake assets:precompile"

    begin
      run(cmd)
    rescue StandardError => e
      if config.precompile_assets_inferred?
        shell.notice "Asset compilation failure ignored.\nAdd 'precompile_assets: true' to ey.yml to abort deploy on failure."
        return
      else
        raise
      end
    end
  end
end