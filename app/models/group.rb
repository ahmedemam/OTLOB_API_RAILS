class Group
  include Mongoid::Document
  field :name, type: String
  field :friend_id, type: String
  embeds_many :users
  embedded_in :orders
  embeds_many :friends
  scope :ordered, -> {order('created_at DESC')}
  validates :name, presence: true
  include Mongoid::Timestamps
end
