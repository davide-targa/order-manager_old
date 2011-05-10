class Delivery < ActiveRecord::Base
  belongs_to :order
  has_many :delivery_lines, :dependent => :destroy
    
  validates :date, :uniqueness => true, :presence => true
end
