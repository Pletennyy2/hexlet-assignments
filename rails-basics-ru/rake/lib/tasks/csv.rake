require 'csv'


namespace :csv do
  desc "TODO"
  task load: :environment do
    file_path = "test/fixtures/files/users.csv"
    users = []

    CSV.foreach(file_path, headers: true) do |row|
      users << User.create(row.to_h)
    end

    puts "#{users.count} users imported successfully."
  end

end
