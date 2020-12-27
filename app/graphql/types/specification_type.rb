module Types
    class SpecificationType < Types::BaseObject
        field :id, ID, null:false
        field :classification, String, null: true
        field :has_trials, Boolean, null: true
        field :specialty, String, null: true
        field :device, Types::DeviceType, null: false
    end
end
  