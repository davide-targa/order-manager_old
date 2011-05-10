class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :article

  validates :barcode, :presence => true
  validates :quantity, :presence => true
end