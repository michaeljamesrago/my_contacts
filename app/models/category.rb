class Category < ApplicationRecord
  validates :name, {
    presence: true,
    length: { maximum: 24 },
    uniqueness: true
  }
end
