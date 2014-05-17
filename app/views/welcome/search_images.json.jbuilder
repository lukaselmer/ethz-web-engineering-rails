json.array!(@images) do |image|
  json.extract! image, :url, :link
end
