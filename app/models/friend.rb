class Friend
  include Mongoid::Document
  field :email, type: String
  field :friend_id, type: String
  field :name, type: String
  field :image, type: String
  embeds_many :users
  embeds_many :orders
  embedded_in :item
  scope :ordered, -> { order('created_at DESC') }
  include Mongoid::Timestamps
end
