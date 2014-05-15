json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :location, :start_at, :duration, :description, :meetup_group_id, :definite
  json.url activity_url(activity, format: :json)
end
