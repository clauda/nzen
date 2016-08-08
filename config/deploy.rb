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

namespace :deploy do
  desc 'Reload application'
  task :reload do
    desc "Reload app after change"
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :publishing, 'deploy:reload'
end

# Default value for keep_releases is 5
set :keep_releases, 2