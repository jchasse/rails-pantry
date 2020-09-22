class Measurement < ApplicationRecord
  belongs_to :item
  belongs_to :user

  accepts_nested_attributes_for :item

  validates_presence_of :quantity

  # def item_attributes=(att)
  #
  # end

  def self.quantity_search(search)
    self.where("quantity >= ?", search)
  end

  def item_name=(name)
    self.item = Item.find_or_create_by(name: name)
  end

  def item_name
    self.item ? self.item.name : nil
  end

end
