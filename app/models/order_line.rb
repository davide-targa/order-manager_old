class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :article

  validates :article_id, :presence => true
  validates :quantity, :presence => true
end