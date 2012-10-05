def compile_assets
  shell.status "bananas"
  rails_version = bundled_rails_version
  
  roles :app_master, :app, :solo, :util do
    cmd = "cd #{paths.active_release} && PATH=#{paths.binstubs}:$PATH #{config.framework_envs} rake assets:precompile"

    if rails_version
      shell.status "Precompiling assets for rails v#{rails_version}"
    else
      shell.warning "Precompiling assets even though Rails was not bundled."
    end

    begin
      run(cmd)
    rescue StandardError => e
      if config.precompile_assets_inferred?
        # If specifically requested, then we want to fail if compilation fails.
        # If we are implicitly precompiling, we want to fail non-destructively
        # because we don't know if the rake task exists or if the user
        # actually intended for assets to be compiled.
        shell.notice "Asset compilation failure ignored.\nAdd 'precompile_assets: true' to ey.yml to abort deploy on failure."
        return
      else
        raise
      end
    end
  end
end