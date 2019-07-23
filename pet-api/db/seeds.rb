require 'yaml'

#
# Pre-require
#

def from_file(resource)
  file_path = Rails.root.join('db', 'seeds', "#{resource}.yml")
  YAML.load(File.read(file_path))[resource]
end

#
# Populate People
#

from_file('people').each do |person_params|
  Person.find_or_create_by(person_params)
end

#
# Populate Animal Types
#
from_file('animal_types').each do |animal_type_params|
  AnimalType.find_or_create_by(animal_type_params)
end

#
# Populate Animal
#

from_file('animals').each do |animal_params|
  owner = Person.find_by(name: animal_params['person'])
  type = AnimalType.find_by(name: animal_params['animal_type'])
  animal_params.merge!('person' => owner, 'animal_type' => type)
  Animal.find_or_create_by(animal_params)
end

