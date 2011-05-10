class DeliveryLine < ActiveRecord::Base
  belongs_to :article
  belongs_to :delivery

  validates :article_id, :quantity, :delivery_id, :presence => true
end
