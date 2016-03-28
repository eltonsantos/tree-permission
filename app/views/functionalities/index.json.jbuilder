json.array!(@functionalities) do |functionality|
  json.extract! functionality, :id, :description
  json.url functionality_url(functionality, format: :json)
end
