import Vue from 'vue';
import Vuex from 'vuex';

import pets from './pets';

Vue.use(Vuex);

export default function () {
  const Store = new Vuex.Store({
    modules: {
      pets,
    },
    strict: process.env.DEV,
  });

  return Store;
}
