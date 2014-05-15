json.array!(@meetup_groups) do |meetup_group|
  json.extract! meetup_group, :id, :owner_id, :topic, :incepted_at, :home_town
  json.url meetup_group_url(meetup_group, format: :json)
end
