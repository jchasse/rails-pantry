class Item < ApplicationRecord

  has_many :measurements
  # validates :name, {presence: {message: "!!!!!!!!!!not blank!!!!!!"}, uniqueness: {message: "must be unique!!!!!"}}
  validates_presence_of :name
  validates_uniqueness_of :name

  validate :is_title_case

  before_validation :make_title_case
  accepts_nested_attributes_for :measurements
  # validate :name_presence
  #
  # def measurements_attributes=(attr)
  #   attr.values.each do |m|
  #     if m[:id] == nil
  #       new_m = Measurement.new(m)
  #       new_m.item = self
  #       new_m.save
  #     else
  #       new_m = Measurement.find_by(id: m[])
  #       new_m.update(m)
  #     end
  #   end
  # end

  private

  def is_title_case
    if name != name.titlecase
      errors.add(:name, "must be titlecased")
    end
  end

  def make_title_case
    self.name = self.name.titlecase
  end
  # def name_presence
  #   if name == nil || name == "" || name == " "
  #     errors.add(:name, "cannot be empty!!!")
  #   end
  # end


end
