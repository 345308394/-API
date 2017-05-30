# # config valid only for current version of Capistrano
# lock "3.8.1"

# set :application, "my_app_name"
# set :repo_url, "git@example.com:me/my_repo.git"

# # Default branch is :master
# # ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# # Default deploy_to directory is /var/www/my_app_name
# # set :deploy_to, "/var/www/my_app_name"

# # Default value for :format is :airbrussh.
# # set :format, :airbrussh

# # You can configure the Airbrussh format using :format_options.
# # These are the defaults.
# # set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# # Default value for :pty is false
# # set :pty, true

# # Default value for :linked_files is []
# # append :linked_files, "config/database.yml", "config/secrets.yml"

# # Default value for linked_dirs is []
# # append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# # Default value for default_env is {}
# # set :default_env, { path: "/opt/ruby/bin:$PATH" }

# # Default value for keep_releases is 5
# # set :keep_releases, 5
# # config valid only for current version of Capistrano
lock "3.8.1"

set :application, "test4"
set :repo_url, 'ssh://passenger@127.0.0.1/home/passenger/test4.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/test4
set :deploy_to, "/var/www/test4"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
# append :linked_files, "public/_attachment"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc "Update the crontab file"
  task :update_crontab do
    on roles(:web) do
      within release_path do
        execute :bundle, "exec whenever -w"
      end
    end
  end
  before "deploy:restart", "deploy:update_crontab"

  desc "reload the database with seed data"
  task :seed do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:stage)  do
          execute :bundle, "exec rake db:seed"
        end
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
