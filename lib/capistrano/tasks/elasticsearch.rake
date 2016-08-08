namespace :elasticsearch do
  %w[start stop restart].each do |command|
    desc "#{command} elasticsearch"
    task command do
      on roles :web do
        run "sudo service elasticsearch #{command}"
      end
    end
  end
end