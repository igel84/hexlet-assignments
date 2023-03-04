require 'csv' 
require 'date' 

namespace :hexlet do
  desc "TODO"
  task :import_users, [:file_name] do |task, args|
    pp args[:file_name]
    csv_text = File.read(args[:file_name])
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash
      pp row
      User.create!(
        first_name: row["first_name"],
        last_name: row["last_name"],
        birthday: DateTime.strptime(row["birthday"], "%m/%d/%Y"),
        email: row["email"],
      )
    end
  end
end
