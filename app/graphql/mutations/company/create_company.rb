class Mutations::Company::CreateCompany < Mutations::BaseMutation

    argument :name, String, required: true
    argument :description, String, required: true
    argument :userID, ID, required: true
  
    field :company, Types::CompanyType, null: true
    field :errors, [String], null: false
  
    def resolve(name:, description:, userID:)
      user = User.find(userID)
      company = Company.create(name: name, description: description, users: [user])
      if company.save
        {
            company: company,
            errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          company: nil,
          errors: company.errors.full_messages
        }
      end
    end
end
