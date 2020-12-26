module Types
  class MutationType < Types::BaseObject
    
    # User mutations
    field :create_user, mutation: Mutations::User::CreateUser

    # Company mutations
    field :create_company, mutation: Mutations::Company::CreateCompany
    field :add_user, mutation: Mutations::Company::AddUser

    # Device mutations
    field :create_device, mutation: Mutations::Device::CreateDevice

    # Specification mutations

  end
end
