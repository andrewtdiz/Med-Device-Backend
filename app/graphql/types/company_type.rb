module Types
    class CompanyType < Types::BaseObject
        field :id, ID, null:false
        field :name, String, null: false
        field :description, String, null: false
        field :devices, [Types::DeviceType], null: false
        field :users, [Types::UserType], null: false
    end
end
