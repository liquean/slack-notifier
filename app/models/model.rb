class Model < ApplicationRecord
  has_many :inventory_entries
  has_many :stores, through: :inventory_entries

  validates_presence_of :name
  validates :name, uniqueness: true

end
