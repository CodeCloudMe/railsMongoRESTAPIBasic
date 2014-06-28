class Post
  include Mongoid::Document
  field :Title, type: String
  field :Body, type: String
  field :created_at, type:Date,  default: ->{ Time.now }
  field :updated_at, type:Date,  default: ->{ Time.now }
end
