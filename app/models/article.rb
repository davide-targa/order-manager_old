class Article < ActiveRecord::Base
  belongs_to :model
  has_many :delivery_lines, :dependent => :destroy
  has_many :order_lines, :dependent => :destroy

  validates :barcode, :presence => true
  validates :size, :uniqueness => { :scope => :model_id }, :presence => true, :inclusion => { :in => CONSTANTS[:valid_numbers] }

  validate :barcode_uniqueness_inside_order

  # Validazione per verificare che il codice a barre
  # sia unico all'interno dell'ordine.
  #
  def barcode_uniqueness_inside_order
    if self.barcode and self.size
      order_models = self.model.order.models
      order_models.each do |model|
        model.articles.each do |article|
          if article.barcode == self.barcode
            errors[:barcode] << "deve essere unico nell'ordine"
            return false
          end
        end
      end
    end
  end
  
end
