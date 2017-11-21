class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id,:quantity,:item,:price


  def item
  	"#{object.product.name}"
  end

  def price
  	"#{object.product.price}"
  end

end
