require_relative "../db_config"

class CreateImages < ActiveRecord::Migration

  def up
    create_table(:images) do |t|
      t.string(:name)
      t.text(:img_url)
      t.integer(:article_id)
    end
  end

  def down
    drop_table :images
  end

end

CreateImages.migrate(ARGV[0])