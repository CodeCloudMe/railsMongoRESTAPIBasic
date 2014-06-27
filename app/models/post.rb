class Post
  include Mongoid::Document
  field :Title, type: String
  field :Body, type: String
  field :created_at, type:Date
end
