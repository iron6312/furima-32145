require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  describe '寄付情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it '郵便番号を入力しないと購入できない' do
      @user_order.post_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
    end
    it '都道府県を入力しないと購入できない' do
      @user_order.ship_form_id = 1
      @user_order.valid?
      expect(@user_order.errors[:ship_form_id]).to include('must be other than 1')
    end
    it '番地を入力しないと購入できない' do
      @user_order.address = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank", 'Post code is invalid. Include hyphen(-)')
    end
    it '市区町村を入力しないと購入できない' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank", 'Post code is invalid. Include hyphen(-)')
    end
    it '電話番号を入力しないと購入できない' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid. Include hyphen(-)', 'Post code is invalid. Include hyphen(-)')
    end
    it '郵便番号はハイフン無しで入力しないと購入できない' do
      @user_order.post_code = '0987654'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '電話番号はハイフン不要で１１桁以内で入力しないと購入できない' do
      @user_order.post_code = '098-9876-99876'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'tokenが空では登録できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
