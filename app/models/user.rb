class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :avatar, type: String
  has_and_belongs_to_many :companys
end
