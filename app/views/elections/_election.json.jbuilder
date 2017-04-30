json.extract! election, :id, :year, :type, :description, :created_at, :updated_at
json.url election_url(election, format: :json)
