json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name, :category
  json.url vendor_url(vendor, format: :json)
end
