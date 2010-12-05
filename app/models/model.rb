class Model < ActiveRecord::Base
  
  validates :code, :description, :presence => true
  validates :code, :uniqueness => true
  has_many :articles, :dependent => :destroy
  accepts_nested_attributes_for :articles, :allow_destroy => true, :reject_if => lambda { |a| a[:barcode].blank? or a[:size].blank? }
  
end
