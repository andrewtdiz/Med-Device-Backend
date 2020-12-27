module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Queries::User::Users
    field :companies, resolver: Queries::Company::Companys
  end
end
