require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '購入情報が保存される場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入情報が保存されない場合' do
      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'stateを選択していないと保存できないこと' do
        @order_address.state_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("State can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが全角数字だと保存できないこと' do
        @order_address.tel = '２０００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid. Input half-width numbers')
      end
      it 'telが半角英字だと保存できないこと' do
        @order_address.tel = '11a11'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid. Input half-width numbers')
      end
      it 'telが空だと保存できないこと' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが9桁以下だと保存できないこと' do
        @order_address.tel = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is out of setting length")
      end
      it 'telが12桁以上だと保存できないこと' do
        @order_address.tel = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is out of setting length")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
