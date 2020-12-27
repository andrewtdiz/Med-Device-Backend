class Device
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :description, type: String
  has_one :specification
  belongs_to :company
end
