class Manufacturer < ActiveRecord::Base
  has_and_belongs_to_many :brands
  has_many :returns

  validates :name, presence: true
  validates :name, uniqueness: true
end
