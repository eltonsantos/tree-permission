json.array!(@managers) do |manager|
  json.extract! manager, :id, :description
  json.url manager_url(manager, format: :json)
end
