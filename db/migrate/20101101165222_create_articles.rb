class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :barcode
      t.decimal :size
      t.references :model

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
