Rails.logger = Logger.new(STDOUT)
Rake::Task['db:fixtures:load'].invoke
