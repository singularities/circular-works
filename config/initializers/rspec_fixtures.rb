unless ENV['PRECOMPILE']
  ActiveRecord::Tasks::DatabaseTasks.fixtures_path = "#{ Rails.root }/spec/fixtures"
end
