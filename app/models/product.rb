class Product < ApplicationRecord


  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { great_than: 0}
  validates :quantity, presence: true, numericality: { great_than_or_equal_to: 0}

  mount_uploader :image, ImageUploader



  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
