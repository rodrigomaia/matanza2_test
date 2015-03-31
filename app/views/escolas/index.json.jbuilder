json.array!(@escolas) do |escola|
  json.extract! escola, :id
  json.url escola_url(escola, format: :json)
end
