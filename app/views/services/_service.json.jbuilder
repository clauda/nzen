json.extract! service, :id, :name, :category_id, :district_id, :description, :phone, :full_address
json.path business_path(service)

json.district do
  json.name service.district.name
end

json.category do
  json.name service.category.name
  json.path category_path(service.category)
end