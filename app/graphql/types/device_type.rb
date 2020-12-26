module Types
    class DeviceType < Types::BaseObject
        field :id, ID, null:false
        field :name, String, null: false
        field :description, String, null: false
        field :company, Types::CompanyType, null: true
    end
end
