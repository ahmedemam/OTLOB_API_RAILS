class Group
  include Mongoid::Document
  field :name, type: String
  embeds_many :users
  embedded_in :orders
  embedded_in :friend
  scope :ordered, -> {order('created_at DESC')}
  validates :name, presence: true
  include Mongoid::Timestamps
end
