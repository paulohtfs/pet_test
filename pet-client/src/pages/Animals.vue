<template>
  <q-page class="flex flex-center">
    <div class="q-pa-md row items-start q-gutter-md">
    <q-btn
      @click="goToCreateAnimal()"
      label="Novo Animal"
      color="secondary" />
      <q-card v-for="animal in this.animals" v-bind:key="animal.id">
        <q-card-section>
          <img :src="animalImg[animal.animal_type.toLowerCase()]">
          <div class="text-h6"> {{ animal.name }} </div>
          Monthly Cost: {{ animal.monthly_cost }}
          <br/>
          Type: {{ animal.animal_type }}
        </q-card-section>
        <q-card-actions>
          <q-btn flat>Save</q-btn>
        </q-card-actions>
      </q-card>
    </div>
  </q-page>
</template>

<style>
</style>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  name: 'People',
  data() {
    return {
      animalImg: {
        // This should be comming from the back-end
        cavalo: 'https://amis-des-arts.com/WebRoot/Store2/Shops/c7572f1b-42d3-460d-814f-d729649c06c8/5489/9FE3/908F/7008/90F9/0A48/3508/C109/ig4658.jpg',
        gato: 'https://images.pexels.com/photos/1544323/pexels-photo-1544323.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        cachorro: 'https://blogmedia.evbstatic.com/wp-content/uploads/rally-legacy/2018/06/28171116/dog-sunglasses-dogs-models-on-monochrome_t20_LO2Wx7-500x250.jpg',
        papagaio: 'https://wereallaboutpets.com/wp-content/uploads/2019/04/Parrotlets-food.jpg',
        iguana: 'https://www.sanignaciobelize.com/Portals/0/EasyDNNRotator/587/images/500-sdritfi0.jpg',
        ornitorrinco: 'https://s.barraques.cat/pngfile/s/171-1717861_12-platypus-hd-wallpapers-platypus-background.jpg',
      },
    };
  },
  beforeMount() {
    this['pets/getAnimals']();
    console.log(this.$router);
  },
  computed: {
    ...mapGetters({
      animals: 'pets/animals',
    }),
  },
  methods: {
    ...mapActions(['pets/getAnimals']),
    goToCreateAnimal() {
      this.$router.push('/pet/animals/new');
    },
  },
};
</script>
