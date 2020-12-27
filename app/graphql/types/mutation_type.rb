module Types
  class MutationType < Types::BaseObject
    
    # User mutations
    field :create_user, mutation: Mutations::User::CreateUser

    # Company mutations
    field :create_company, mutation: Mutations::Company::CreateCompany
    field :add_user, mutation: Mutations::Company::AddUser
    field :add_device, mutation: Mutations::Company::AddDevice
    field :remove_device, mutation: Mutations::Company::RemoveDevice

    # Device mutations
    field :create_device, mutation: Mutations::Device::CreateDevice

    # Specification mutations
    field :update_specification, mutation: Mutations::Specification::UpdateSpecification

  end
end
