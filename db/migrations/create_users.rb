require_relative "../db_config"

class CreateUsers < ActiveRecord::Migration

  def up
    create_table(:users) do |t|
      t.string(:name)
      t.string(:user_name)
    end
  end

  def down
    drop_table :users
  end

end

CreateUsers.migrate(ARGV[0])