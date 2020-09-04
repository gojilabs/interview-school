<template lang="pug">
  #app
    el-container
      el-header
        el-menu(
          router=true
          mode="horizontal"
        )
          el-menu-item.logo(index="/") Main page
      el-main
        router-view
      el-footer
        center
          |2020 Test task for Adam by Roman
</template>

<script lang="js">
  export default {
    name: 'layout',
    data: () => { return {}; },
    mounted() {
    },
    computed: {
    }
  };
</script>

<style lang="stylus">
  body
    color: #222
    font-family: 'Lato', sans-serif;
    padding: 0px;
    margin: 0px;
  html, body
    min-height 100%
  h1, h2, h3, h4, h5
    font-weight: 200
  #app
    min-height: 100%
  .hide
    display: none
  .center
    text-align: center
  .el-main
    padding: 0
  footer.el-footer
    background: #282629
    padding: 10vh 0
    *
      color white
</style>


