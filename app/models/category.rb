class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :deals
  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    deals.sum('amount')
  end
end
