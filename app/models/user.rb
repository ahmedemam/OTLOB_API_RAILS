class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :image, type: String

  embeds_many :friends
  embeds_many :groups
  embeds_many :orders

  scope :ordered, -> {order('created_at DESC')}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  include Mongoid::Timestamps

end
