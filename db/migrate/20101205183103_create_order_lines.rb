class CreateOrderLines < ActiveRecord::Migration
  def self.up
    create_table :order_lines do |t|
      t.references :article
      t.references :order
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :order_lines
  end
end
