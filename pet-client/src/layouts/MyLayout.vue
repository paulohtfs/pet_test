<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          @click="leftDrawerOpen = !leftDrawerOpen"
          aria-label="Menu">
          <q-icon name="menu" />
        </q-btn>

        <q-toolbar-title>
          Pet App
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-drawer
      v-model="leftDrawerOpen"
      bordered
      content-class="bg-grey-2">

      <q-list>
        <q-item-label header>Menu</q-item-label>

        <q-item clickable @click="goToPeople()">
          <q-item-section avatar>
            <q-icon name="people" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Pessoas</q-item-label>
            <q-item-label caption>Registro de Usuários</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable @click="goToAnimalTypes()">
          <q-item-section avatar>
            <q-icon name="style" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Tipos de Animais</q-item-label>
            <q-item-label caption>Categoria de animais</q-item-label>
          </q-item-section>
        </q-item>
        <q-item clickable @click="goToAnimals()">
          <q-item-section avatar>
            <q-icon name="pets" />
          </q-item-section>
          <q-item-section>
            <q-item-label>Animais</q-item-label>
            <q-item-label caption>Registro de Animais</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
export default {
  name: 'Home',
  data() {
    return {
      leftDrawerOpen: this.$q.platform.is.desktop,
    };
  },
  methods: {
    goToPeople() {
      this.$router.push('/pet/people');
    },
    goToAnimals() {
      this.$router.push('/pet/animals');
    },
    goToAnimalTypes() {
      this.$router.push('/pet/animal_types');
    },
  },
};
</script>

<style>
</style>
