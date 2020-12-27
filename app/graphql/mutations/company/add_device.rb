class Mutations::Company::AddDevice < Mutations::BaseMutation

    argument :companyID, ID, required: true
    argument :deviceID, ID, required: true
  
    field :company, Types::CompanyType, null: true
    field :errors, [String], null: false
  
    def resolve(companyID:, deviceID:)
      company = Company.find(companyID)
      device = Device.find(deviceID)
      if Company.where(id: companyID).find_one_and_update( :$push => {device_ids: BSON::ObjectId.from_string(deviceID)})
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
