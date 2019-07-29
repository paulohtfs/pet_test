import Index from 'pages/Index.vue';
import Layout from 'layouts/MyLayout.vue';
import People from 'pages/People.vue';
import Animals from 'pages/Animals.vue';
import AnimalTypes from 'pages/AnimalTypes.vue';
import NewAnimal from 'pages/NewAnimal.vue';

const routes = [
  {
    path: '/',
    redirect: '/pet/home',
  },
  {
    path: '/pet',
    component: Layout,
    children: [
      {
        path: 'home',
        component: Index,
      },
      {
        path: 'people',
        component: People,
      },
      {
        path: 'animals',
        component: Animals,
      },
      {
        path: 'animals/new',
        component: NewAnimal,
      },
      {
        path: 'animal_types',
        component: AnimalTypes,
      },
    ],
  },
];

// Always leave this as last one
if (process.env.MODE !== 'ssr') {
  routes.push({
    path: '*',
    component: () => import('pages/Error404.vue'),
  });
}

export default routes;
