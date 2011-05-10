class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table :deliveries do |t|
      t.date :date
      t.references :order

      t.timestamps
    end
  end

  def self.down
    drop_table :deliveries
  end
end
