class Measurement < ApplicationRecord
  belongs_to :item

  accepts_nested_attributes_for :item

  validates_presence_of :quantity

  # def item_attributes=(att)
  #
  # end

  def item_name=(name)
    self.item = Item.find_or_create_by(name: name)
  end

  def item_name
    self.item ? self.item.name : nil
  end

end
