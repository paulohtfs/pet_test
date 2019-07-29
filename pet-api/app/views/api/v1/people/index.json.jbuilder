json.array! @people do |person|
  json.id person.id
  json.name person.name
  json.document person.document
  json.birth_date person.birth_date
end
