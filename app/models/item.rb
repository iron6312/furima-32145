class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :fee
  belongs_to :ship_form
  belongs_to :day_to_ship
  belongs_to :status
  belongs_to :category

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :fee_id
    validates :ship_form_id
    validates :day_to_ship_id
    validates :status_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end
  belongs_to :user
  has_one_attached :image

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, format: { with: VALID_PRICE_REGEX }

  with_options numericality: { greater_than: 299,  less_than: 10000000 } do
    validates :price
  end
end