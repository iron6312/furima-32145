class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :ship_form_id, :city, :address, :building_name, :phone_number, :token, :user_id, :item_id

  with_options numericality: { other_than: 1 } do
    validates :ship_form_id
  end
  with_options presence: true do
    validates :post_code
    validates :city
    validates :address
    validates :phone_number
    validates :token
  end

  # with_options format: { with: /\A[ぁ-んァ-ン一-龥]/.freeze } do
  #   validates :city
  #   validates :address
  #   validates :building_name
  # end
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }

  validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Include hyphen(-)' }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, ship_form_id: ship_form_id, city: city, address: address, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
end
