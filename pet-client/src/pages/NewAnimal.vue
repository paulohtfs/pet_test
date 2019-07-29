<template>
  <q-page class="flex flex-center">
    <div class="q-pa-md" style="min-width: 500px">
      <div class="q-gutter-md">
        <div class="text-h6"> Novo Animal </div>
        <q-select
          outlined
          v-model="person"
          label="Dono do Animal"
          :options="people" />

        <q-select
          outlined
          v-model="animalType"
          label="Tipo do Animal"
          :options="animalTypes" />

        <q-input
          outlined
          v-model="animal"
          label="Nome do Animal"
          :rules="[val => !!val || 'Campo não pode ficar em branco']" />

        <q-input
          outlined
          v-model.number="monthly"
          type="number"
          label="Custo Mensal" />

        <q-btn
          @click="create()"
          label="Criar"
          color="secondary" />
      </div>
    </div>
  </q-page>
</template>

<style>
</style>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  name: 'NewAnimal',
  data() {
    return {
      person: null,
      animalType: null,
      animal: null,
      monthly: 0,
    };
  },
  beforeMount() {
    this['pets/getPeople']();
    this['pets/getAnimalTypes']();
  },
  computed: {
    ...mapGetters({
      people: 'pets/people',
      animalTypes: 'pets/animalTypes',
    }),
  },
  methods: {
    ...mapActions([
      'pets/createAnimal',
      'pets/getPeople',
      'pets/getAnimalTypes',
    ]),
    create() {
      const animal = {
        name: this.$data.animal,
        monthly_cost: this.$data.monthly,
        animal_type_id: this.$data.animalType.value,
      };
      const personId = this.$data.person.value;

      this['pets/createAnimal']({ personId, animal });
    },
  },
};
</script>
