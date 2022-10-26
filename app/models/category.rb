class Category < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :contact

  before_save :upcase_name
  validates :name, {
    presence: true,
    length: { maximum: 24 },
    uniqueness: true
  }

  def add(contact)
    members << contact
  end

  private
    def upcase_name
      self.name = name.upcase
    end
end
