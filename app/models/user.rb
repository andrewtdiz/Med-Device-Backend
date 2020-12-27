class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :email, type: String
  field :avatar, type: String
  has_and_belongs_to_many :companys
end
