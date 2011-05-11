class Order < ActiveRecord::Base
  has_many :deliveries, :dependent => :destroy
  has_many :models, :dependent => :destroy
  has_many :order_lines, :dependent => :destroy
  
  validates :date, :presence => true, :uniqueness => { :scope => :expiration_date }
  validates :expiration_date, :presence => true
  validate :order_date_before_expiration_date

  def order_date_before_expiration_date
    if self.date and self.expiration_date and self.date > self.expiration_date
      errors[:date] << "deve precedere la data di scadenza"
      errors[:expiration_date] << "deve essere successiva alla data dell'ordine"
    end
  end

end
