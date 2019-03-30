class Item
  include Mongoid::Document
  field :comment, type: String
  field :name, type: String
  field :amount, type: Integer
  field :price, type: Integer
  field :friend_id, type: String

  embedded_in :order
  embeds_one :friend
  scope :ordered, -> {order('created_at DESC')}
  include Mongoid::Timestamps

end
