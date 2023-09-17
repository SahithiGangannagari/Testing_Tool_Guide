<template>
  <div id="app">
    <!-- <img alt="Vue logo" src="./assets/logo.png"> -->
    <HelloWorld msg="TechTest Navigator: Testing Tool Guide 🚀"/>
    <CheckList />
    <br>
    <!-- <input v-model="name">
    <br>
    <br>
    <button @click="sample2"> click here </button>
    <br>
    <div class="assignedTags">
      <span v-for="(value, index) in linkedTags" :key="index">
        <span class= "labelText" :title="value">{{value}}</span>
      </span>
    </div> -->
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import CheckList from './components/checkList.vue'
import axios from 'axios'

export default {
  data () {
    return {
      name: '',
      linkedTags: {}
    }
  },
  name: 'App',
  components: {
    HelloWorld,
    CheckList
  },
  created () {
    this.sample()
  },
  methods: {
    sample () {
      const path = '/sample'
      const params = new URLSearchParams()
      axios.get(path, {
        params: params
      })
        .then((res) => {
          this.linkedTags = res.data
          // console.log(res.data)
        })
        .catch((error) => {
          console.error(error)
        })
    },
    sample2 () {
      console.log(this.name)
      const path = '/sample2'
      const params = new URLSearchParams()
      params.append('name', this.name)
      if (this.request) {
        this.request.cancel()
      }
      const axiosSource = axios.CancelToken.source()
      this.request = { cancel: axiosSource.cancel }
      axios.get(path, {
        params: params
      })
        .then((res) => {
          this.sample()
        })
        .catch((error) => {
          console.error(error)
        })
    }
  }
}
</script>

<style>
* {
  /* font-size: small; */
  font-family: Arial;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  /* width: 100%;
   */
   /* width: max-content; */
}
.assignedTags {
  margin-top: 30px;
  padding: 20px;
  border: 1.5px solid #ced4da;
}
.selectedItems {
  display: -webkit-inline-box;
  max-width: 170px;
  font-size: 13px;
  line-height: 15px;
  height: 20px;
  /* height: max-content; */
  border: 0.5px solid rgba(0, 0, 0, 0.42);
  border-radius: 2px;
  position: relative;
  margin: 3px 2px 3px 2px;
  /* margin: 2px 1px 2px 2px; */
  padding: 2px 1px 0px 3px;
  background-color: #ebecf0;
}
/* .labelText {
  display: block;
  max-width: 110px;
  text-overflow: ellipsis;
  color: black;
  overflow: hidden;
  text-align: left;
  cursor: default;
  white-space: nowrap;
} */
</style>
