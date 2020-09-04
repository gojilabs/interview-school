import Vue from 'vue'
import VueRouter from 'vue-router'

import {
  homePage,
} from './components'

Vue.use(VueRouter);

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: homePage,
      name: homePage.name,
      title: homePage.title,
      meta: {
        mainMenu: true
      }
    },
    { path: '*', redirect: { name: homePage.name } }
  ],
  computed: {}
})
