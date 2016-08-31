namespace :elasticsearch do
  desc 'Reindex all'
  task reindex: :environment do
    on roles :web do
      run "cd /var/www/nzen/current && bundle exec rake searchkick:reindex:all"
    end
  end

  %w[start stop restart].each do |command|
    desc "#{command} elasticsearch"
    task command do
      on roles :web do
        run "sudo service elasticsearch #{command}"
      end
    end
  end
end