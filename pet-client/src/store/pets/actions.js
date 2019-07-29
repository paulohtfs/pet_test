import axios from 'axios';
import { Notify } from 'quasar';

const actions = {};
const baseUrl = 'http://localhost:3000';

actions.getAnimals = ({ commit }) => {
  const url = `${baseUrl}/api/v1/animals`;

  axios.get(url)
    .then(response => commit('setAnimals', response.data));
};

actions.createAnimal = ({ commit }, { personId, animal }) => {
  const url = `${baseUrl}/api/v1/person/${personId}/animals`;

  axios.post(url, animal)
    .then((response) => {
      Notify.create({ message: 'Animal Registrado!' });
      commit('currentAnimal', response.data);
    })
    .catch(() => {
      Notify.create({ message: 'Erro ao Registrar Animal!', color: 'negative' });
    });
};

actions.getPeople = ({ commit }) => {
  const url = `${baseUrl}/api/v1/people`;

  axios.get(url)
    .then(response => commit('setPeople', response.data));
};

actions.getAnimalTypes = ({ commit }) => {
  const url = `${baseUrl}/api/v1/animal_types`;

  axios.get(url)
    .then(response => commit('setAnimalTypes', response.data));
};

export default actions;
