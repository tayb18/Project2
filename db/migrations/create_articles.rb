require_relative "../db_config"

class CreateArticles < ActiveRecord::Migration

  def up
    create_table(:articles) do |t|
      t.integer(:user_id)
      t.date(:date_created)
      t.date(:date_edited)
      t.string(:title)
      t.text(:content)
    end
  end

  def down
    drop_table :articles
  end

end

CreateArticles.migrate(ARGV[0])