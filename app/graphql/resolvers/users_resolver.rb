module Resolvers
  class Users < GraphQL::Schema::Resolver
    type UserType.connection_type, null: false
    argument :id, Int, required: true
    argument :email, String, required: true
    argument :name, String, required: true

    users = [
      { id: '1', name: 'hello', email: 'hello@sample.com' },
      { id: '2', name: 'world', email: 'world@sample.com' },
    ]

    def resolve(**args)
      users
    end
  end
end
