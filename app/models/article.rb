class Article < ActiveRecord::Base
  
  VALID_NUMBERS = [
                  35, 35.5,
                  36, 36.5,
                  37, 37.5,
                  38, 38.5,
                  39, 39.5,
                  40, 40.5,
                  41]
  
  belongs_to :model
  #validates :barcode, :size, :presence => true
  validates :barcode, :uniqueness => true
  
end
