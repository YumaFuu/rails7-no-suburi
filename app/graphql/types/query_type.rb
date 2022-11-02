module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false

    def users
      [
        { id: '1', name: 'hello', email: 'hello@sample.com' },
        { id: '2', name: 'world', email: 'world@sample.com' },
      ]
    end
  end
end
