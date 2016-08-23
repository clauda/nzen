json.extract! service, :id, :name, :category_id, :district_id, :description, :phone
json.url service_url(service, format: :json)

json.district do
  json.name service.district.name
end

json.category do
  json.name service.category.name
end