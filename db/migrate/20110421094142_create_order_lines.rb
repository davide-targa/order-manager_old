class CreateOrderLines < ActiveRecord::Migration
  def self.up
    create_table :order_lines do |t|
      t.integer :quantity
      t.references :article
      t.references :delivery
      t.references :order

      t.timestamps
    end
  end

  def self.down
    drop_table :order_lines
  end
end
