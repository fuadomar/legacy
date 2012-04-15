require "bundler/capistrano"
require "rvm/capistrano"
require "erb"

set(:rvm_type)          { :system }
set(:ruby_version)      { '1.8.7-p352' }
set(:user)              { 'ubuntu' }
set(:rvm_ruby_string)   { "1.8.7-p352" }
set(:rvm_path)          { "/usr/local/rvm" }

set :repository, "https://github.com/fuadcse/legacy.git"
set :application, "ec2-23-21-1-121.compute-1.amazonaws.com"
set :deploy_via, :remote_cache #:export | :remote_cache
set :deploy_to, "/vol/apps/legacy"
set :rails_env, "production --trace"
set :rake, 'bundle exec rake'

set :scm, 'git'
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#the user of the server which will run commands on server
ssh_options[:port] = 22
ssh_options[:username] = 'ubuntu'
ssh_options[:host_key] = 'ssh-dss'
ssh_options[:paranoid] = false
set :use_sudo, true
ssh_options[:keys] = %w(~/ssh-keys/legacy/legacytest4a.pem)

role :web, "ec2-23-21-1-121.compute-1.amazonaws.com" # Your HTTP server, Apache/etc
role :app, "ec2-23-21-1-121.compute-1.amazonaws.com" # This may be the same as your `Web` server
role :db, "ec2-23-21-1-121.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run
role :db, "ec2-23-21-1-121.compute-1.amazonaws.com"

after "deploy:setup", :"deploy:create_shared_files_and_directories"

after "deploy:symlink", :link_shared_files
after "deploy:symlink", :"deploy:install_bundle"
after "deploy:symlink", :"deploy:restart"

task :link_shared_files, :roles => :app do
  #run "rm -rf #{current_path}/.bundle; ln -s #{shared_path}/config/.bundle #{current_path}/.bundle"
  #run "rm #{current_path}/vendor/bundle; ln -s #{shared_path}/bundle #{current_path}/vendor/bundle"
  run "rm -rf #{current_path}/tmp/sockets; ln -s #{shared_path}/sockets #{current_path}/tmp/sockets"
  run "rm -rf #{current_path}/public/uploads; ln -s #{shared_path}/uploads #{current_path}/public/uploads"
  run "rm -rf #{current_path}/public/.htaccess; rm -rf #{current_path}/public/dispatch.fcgi"
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end

  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sudo touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end

  task :install_bundle, :roles => :app do
    run "cd #{current_path}; rvmsudo bundle install"
  end

  task :create_shared_files_and_directories, :role => :app do
    run "sudo mkdir -p #{shared_path}/sockets"
    run "sudo mkdir -p #{shared_path}/config/.bundle"
    run "sudo mkdir -p #{shared_path}/bundle"
    run "sudo mkdir -p #{shared_path}/uploads"
    #run "sudo touch #{shared_path}/config/.bundle/config"

    #run "sudo echo '---' >> #{shared_path}/config/.bundle/config"
    #run "sudo echo 'BUNDLE_PATH: vendor/bundle' >> #{shared_path}/config/.bundle/config"
    #run "sudo echo \"BUNDLE_DISABLE_SHARED_GEMS: '1'\" >> #{shared_path}/config/.bundle/config"
  end
end
