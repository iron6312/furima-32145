class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :category
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :fee_id
    validates :ship_form_id
    validates :shipment_id
    validates :day_to_ship_id
    validates :status_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :fee_id
    belongs_to :ship_form_id
    belongs_to :shipment_id
    belongs_to :day_to_ship_id
    belongs_to :status_id
    belongs_to :category_id
  end
    belongs_to :user
    has_one_attached :image

