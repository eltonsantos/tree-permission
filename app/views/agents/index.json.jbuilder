json.array!(@agents) do |agent|
  json.extract! agent, :id, :name, :active, :manager_id
  json.url agent_url(agent, format: :json)
end
