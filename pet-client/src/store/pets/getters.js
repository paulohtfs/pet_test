const getters = {};

getters.animals = state => state.animals;
getters.people = state => state.people.map(person => ({ label: person.name, value: person.id }));
getters.animalTypes = state => state.types.map(type => ({ label: type.name, value: type.id }));
getters.currentAnimal = state => state.currentAnimal;

export default getters;
