module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false

    def users
      [ { id: 'id', name: 'aa', email: 'yuma.fuu05@gmail.com' } ]
    end
  end
end
