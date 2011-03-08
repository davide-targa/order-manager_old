class OrderLine < ActiveRecord::Base
  belongs_to :order
  belongs_to :article
  attr_accessor :model, :size

  validates :model, :size, :presence => true

  before_save :set_barcode

  # Dal form ottengo il codice del modello e la taglia. Adesso da questi dati
  # ricavo il codice a barre corrispondente e setto l'article id nella riga
  # d'ordine corrente.
  #
  def set_barcode
    model_id = Model.find(self.model)
    article = Article.where(:model_id => model_id, :size => self.size).first
    if article.nil?
      return false
    else
      self.article_id = article.id
    end
  end
end
