json.extract! election, :id, :year, :type_election, :description, :created_at, :updated_at
json.url election_url(election, format: :json)
