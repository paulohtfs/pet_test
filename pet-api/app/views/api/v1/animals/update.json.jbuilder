json.animal do
  json.name @animal.name
  json.monthly_cost @animal.monthly_cost
  json.animal_type @animal.type.name
end
