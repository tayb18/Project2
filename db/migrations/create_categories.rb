require_relative "../db_config"

class CreateCategories < ActiveRecord::Migration

  def up
    create_table(:categories) do |t|
      t.string(:name)
    end
  end

  def down
    drop_table :categories
  end

end

CreateCategories.migrate(ARGV[0])