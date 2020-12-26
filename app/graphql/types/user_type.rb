module Types
  class UserType < Types::BaseObject
    field :id, ID, null:false
    field :name, String, null: false
    field :email, String, null: false
    field :avatar, String, null: false
    field :companys, [Types::CompanyType], null: true
  end
end
