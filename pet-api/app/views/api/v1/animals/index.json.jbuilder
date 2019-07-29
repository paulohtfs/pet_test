json.array! @animals do |animal|
  json.id animal.id
  json.name animal.name
  json.monthly_cost animal.monthly_cost
  json.animal_type animal.type.name
end
