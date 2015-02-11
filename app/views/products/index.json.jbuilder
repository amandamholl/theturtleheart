json.array!(@products) do |product|
  json.extract! product, :id, :id_num, :image_url
  json.url product_url(product, format: :json)
end
