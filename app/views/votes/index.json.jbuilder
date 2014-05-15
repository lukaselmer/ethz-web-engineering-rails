json.array!(@votes) do |vote|
  json.extract! vote, :id, :membership_id, :activity_id
  json.url vote_url(vote, format: :json)
end
