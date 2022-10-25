class Category < ApplicationRecord
  before_save :upcase_name
  validates :name, {
    presence: true,
    length: { maximum: 24 },
    uniqueness: true
  }

  private
    def upcase_name
      self.name = name.upcase
    end
end
