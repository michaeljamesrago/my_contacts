class Contact < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :categories, through: :memberships, source: :category

  validates :name, {
    presence: true,
    length: { maximum: 32 }
  }
  validates :email, {
    presence: true,
    length: { maximum: 255 }
  }
  self.per_page = 10

  def join(category)
    categories << category
  end

end
