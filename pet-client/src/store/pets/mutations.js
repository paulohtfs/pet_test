const mutations = {};

mutations.setAnimals = (state, animals) => {
  state.animals = animals;
};

mutations.setPeople = (state, people) => {
  state.people = people;
};

mutations.setAnimalTypes = (state, types) => {
  state.types = types;
};

export default mutations;
