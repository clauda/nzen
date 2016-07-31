# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'nzen'
set :repo_url, 'git@github.com:krawdyah/nzen.git'

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :use_sudo, false

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/nzen'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

set :unicorn_script, 'scripts/unicorn.sh'

namespace :unicorn do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command do
      on roles :app do
        within release_path do
          execute fetch(:unicorn_script), command
        end
      end
    end
  end
end

# Default value for keep_releases is 5
set :keep_releases, 2
