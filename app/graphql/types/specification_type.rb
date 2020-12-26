module Types
    class SpecificationType < Types::BaseObject
        field :id, ID, null:false
        field :classification, String, null: false
        field :has_trials, Boolean, null: false
        field :specialty, String, null: false
        field :device, Types::DeviceType, null: false
    end
end
  