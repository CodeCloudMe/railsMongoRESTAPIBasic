class Vendor
  include Mongoid::Document
  field :name, type: String
  field :category, type: String
end
