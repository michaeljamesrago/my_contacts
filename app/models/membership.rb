class Membership < ApplicationRecord
  belongs_to :contact
  belongs_to :category
  validates :contact_id, presence: true
  validates :category_id, presence: true
end
