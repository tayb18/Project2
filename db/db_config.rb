require 'active_record'

# This will print out our SQL queries
ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/foodnetwork.sqlite3"
);

Dir.glob("models/*.rb").each do |path|
    require_relative "../#{path}"
end