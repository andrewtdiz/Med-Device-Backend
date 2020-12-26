class Mutations::User::CreateUser < ::Mutations::BaseMutation

    argument :name, String, required: true
    argument :email, String, required: true
    argument :avatar, String, required: true
  
    field :user, Types::UserType, null: true
    field :errors, [String], null: false
  
    def resolve(name:, email:, avatar:)
      user = User.new(name: name, email: email, avatar: avatar)
      if user.save
        {
            user: user,
            errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
end