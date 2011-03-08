class Order < ActiveRecord::Base
  has_many :order_lines, :dependent => :destroy
  accepts_nested_attributes_for :order_lines, :allow_destroy => true#, :reject_if => lambda { |a| a[:barcode].blank? or a[:size].blank? }
end
