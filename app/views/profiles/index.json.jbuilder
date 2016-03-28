json.array!(@profiles) do |profile|
  json.extract! profile, :id, :manager_id, :agent_id, :active, :description
  json.url profile_url(profile, format: :json)
end
