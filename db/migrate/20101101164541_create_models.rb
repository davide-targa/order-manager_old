class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.string :code
      t.text :description
      t.references :order

      t.timestamps
    end
  end

  def self.down
    drop_table :models
  end
end
