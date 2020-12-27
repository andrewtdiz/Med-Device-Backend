class Mutations::Specification::UpdateSpecification < Mutations::BaseMutation

    argument :specificationID, String, required: true
    argument :classification, String, required: false
    argument :has_trials, Boolean, required: false
    argument :specialty, String, required: false
    
    field :specification, Types::SpecificationType, null: true
    field :errors, [String], null: false
  
    def resolve(specificationID:, classification: nil, has_trials: nil, specialty: nil)
      specification = Specification.find(specificationID)
      if !classification.nil?
        specification.classification = classification
      end
      if !has_trials.nil?
        specification.has_trials = has_trials
      end
      if !specialty.nil?
        specification.specialty = specialty
      end

      if specification.save
        {
            specification: specification,
            errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          specification: nil,
          errors: specification.errors.full_messages
        }
      end
    end
end