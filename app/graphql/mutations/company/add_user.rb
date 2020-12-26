class Mutations::Company::AddUser < Mutations::BaseMutation

    argument :companyID, ID, required: true
    argument :userID, ID, required: true
  
    field :company, Types::CompanyType, null: true
    field :errors, [String], null: false
  
    def resolve(companyID:, userID:)
      company = Company.find(companyID)
      user = User.find(userID)
      Company.where(id: companyID).find_one_and_update({ :$push => {user_ids: userID}})
      if User.where(id: userID).find_one_and_update({ :$push => {company_ids: companyID}})
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
