class Item < ApplicationRecord

  validates :name, {presence: {message: "!!!!!!!!!!not blank!!!!!!"}, uniqueness: {message: "must be unique!!!!!"}} 

  # validate :name_presence

  # private

  # def name_presence
  #   if name == nil || name == "" || name == " "
  #     errors.add(:name, "cannot be empty!!!")
  #   end
  # end


end
