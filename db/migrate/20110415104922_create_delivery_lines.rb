class CreateDeliveryLines < ActiveRecord::Migration
  def self.up
    create_table :delivery_lines do |t|
      t.integer :quantity
      t.references :article
      t.references :delivery

      t.timestamps
    end
  end

  def self.down
    drop_table :delivery_lines
  end
end
