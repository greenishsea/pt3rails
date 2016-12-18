json.locations do |json|
  json.array!(@locations) do |location|
    json.extract! location, :id, :title, :description, :image
  end
end
