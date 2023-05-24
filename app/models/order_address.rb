class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :state_id, :city, :address, :building, :tel
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :state_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :tel, numericality: {only_integer: true, message: "tel is invalid. Input half-width numbers"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postcode: postcode, state_id: state_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end

end