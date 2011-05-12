class Model < ActiveRecord::Base
  has_many :articles, :dependent => :destroy
  belongs_to :order
  
  validates :code, :presence => true, :uniqueness => { :scope => :order_id}
  validates :description, :presence => true
  validates :order_id, :presence => true
  
end
