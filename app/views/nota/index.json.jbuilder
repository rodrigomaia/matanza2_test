json.array!(@nota) do |notum|
  json.extract! notum, :id
  json.url notum_url(notum, format: :json)
end
