class Mutations::Device::CreateDevice < Mutations::BaseMutation

    argument :name, String, required: true
    argument :description, String, required: true
    argument :companyID, String, required: true
    
    field :device, Types::DeviceType, null: true
    field :errors, [String], null: false
  
    def resolve(name:, description:, companyID:)
      company = Company.find(companyID)
      device = Device.new(name: name, description: description, company: company)
      Company.where(id: companyID).find_one_and_update(:$push => {device_ids: BSON::ObjectId.from_string(device.id)})
      specification = Specification.new(classification: nil, has_trials: nil, specialty: nil, device: device)
      specification.save
      if device.save
        {
            device: device,
            errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          device: nil,
          errors: device.errors.full_messages
        }
      end
    end
end