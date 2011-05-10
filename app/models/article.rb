class Article < ActiveRecord::Base
  belongs_to :model
  has_many :delivery_lines, :dependent => :destroy
  has_many :order_lines, :dependent => :destroy

  validates :barcode, :presence => true
  validates :size, :uniqueness => { :scope => :model_id }, :presence => true, :inclusion => { :in => CONSTANTS[:valid_numbers] }

end
