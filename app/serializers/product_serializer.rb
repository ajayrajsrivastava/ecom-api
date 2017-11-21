class ProductSerializer < ActiveModel::Serializer
	attributes :id,:name,:category,:quantity_left,:price
end
