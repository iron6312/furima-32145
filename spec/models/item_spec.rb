require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    # binding.pry
  end

  context '出品条件' do
    it '商品画像を１枚つけないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end
    it '商品名がないと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がないと出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors[:category_id]).to include('is not a number')
    end
    it '商品の状態についての情報がないと出品できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors[:status_id]).to include('is not a number')
    end
    it '配送料の負担についての情報がないと出品できない' do
      @item.fee_id = nil
      @item.valid?
      expect(@item.errors[:fee_id]).to include('is not a number')
    end
    it '発送元の地域についての情報がないと出品できない' do
      @item.ship_form_id = nil
      @item.valid?
      expect(@item.errors[:ship_form_id]).to include('is not a number')
    end
    it '発送までの日数についての情報がないと出品できない' do
      @item.day_to_ship_id = nil
      @item.valid?
      expect(@item.errors[:day_to_ship_id]).to include('is not a number')
    end
    it '価格についての情報がないと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が299だと出品できない' do
      @item.price = '300'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1', 'Fee must be other than 1', 'Ship form must be other than 1', 'Day to ship must be other than 1', 'Status must be other than 1')
    end
    it '価格が10000000だと出品できない' do
      @item.price = '9999999'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1', 'Fee must be other than 1', 'Ship form must be other than 1', 'Day to ship must be other than 1', 'Status must be other than 1')
    end
    it '販売価格は半角数字のみでないと出品できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1', 'Fee must be other than 1', 'Ship form must be other than 1', 'Day to ship must be other than 1', 'Status must be other than 1')
    end
  end
end
