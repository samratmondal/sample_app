require "bundler/capistrano"                                   # Execute "bundle install" after deploy


# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))       # Add RVM "lib" directory to the load path (represented in Ruby by $:)
# require "rvm/capistrano"                                     # RVM/Capistrano integration


set :application, "sample_app"                               # Application being deployed


default_run_options[:pty] = true                             # Enable passphrase prompt from git
set :repository,   "https://github.com/samratmondal/sample_app.git" # Location of Application source code repository
set :scm, :git   # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
                 # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#set :scm_user,     "JWLGitHub"                               # GitHub user                 
#set :scm_password, "GitHub1"                                 # GitHub password
set :branch,       "HEAD"                                  # Branch to checkout for deployment


set :user,          "bitnami"                             # deploy user
set :use_sudo,      false                                    # PROHIBIT "sudo" command 
set :deploy_to,     "/home/bitnami/#{application}"   # deploy path
set :keep_releases, 5                                        # Keep last 5 deployments
default_run_options[:shell] = '/bin/bash --login'            # Use the bash prompt to send commands thru


after 'deploy:update_code', 'deploy:migrate'       # Runs DB Migrations AFTER deploying code
role :web, "192.168.0.14"                          # Your HTTP server, Apache/etc
role :app, "192.168.0.14"                          # This may be the same as your `Web` server
role :db,  "192.168.0.14", :primary => true        # This is where Rails migrations will run
# role :db,  "your slave db-server here"


after "deploy:restart", "deploy:cleanup"           # Clean up old releases on each deploy


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end