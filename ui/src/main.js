import Vue from 'vue'

Vue.config.productionTip = false

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import 'element-ui/lib/theme-chalk/col.css'
Vue.use(ElementUI)

import {
  layout
} from './components'
import store from './store'
import router from './routes'

new Vue({
  router,
  store,
  components: {
  },
  render: h => h(layout),
  watch: {},
  created: function() {},
  mounted: function() {
    this.$nextTick(function() {});
  },
}).$mount('#app')
