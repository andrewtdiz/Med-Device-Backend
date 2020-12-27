class Specification
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  field :classification, type: Integer
  field :has_trials, type: Boolean
  field :specialty, type: String
  belongs_to :device
end
