class Company
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :description, type: String
  has_many :devices
  has_and_belongs_to_many :users
end
