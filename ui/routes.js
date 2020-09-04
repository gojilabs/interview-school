import Vue from 'vue'
import VueRouter from 'vue-router'

import {
  HomePage,
  Auth
} from './src/components/pages'
import {
  Login,
  SignUp,
  RestorePassword
} from "./src/components";

Vue.use(VueRouter);

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: HomePage,
      name: HomePage.name,
      title: HomePage.title,
      meta: {
        mainMenu: true
      }
    },
    {
      path: '/auth',
      component: Auth,
      children: [
        {
          path: 'login',
          component: Login,
          title: Login.name,
          meta: {
            mainMenu: true,
            parentClass: 'login',
          }
        },
        {
          path: 'sign-up',
          component: SignUp,
          title: SignUp.name,
          meta: {
            mainMenu: true,
            parentClass: 'sign-up',
          }
        },
        {
          path: 'restore',
          component: RestorePassword,
          title: RestorePassword.name,
          meta: {
            mainMenu: true,
            parentClass: 'sign-up',
          }
        },
      ]
    },
    { path: '*', redirect: { name: HomePage.name } }
  ],
  computed: {

  }
})
