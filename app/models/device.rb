class Device
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  has_one :specification
  belongs_to :company
end
