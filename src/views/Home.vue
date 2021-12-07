<template>

    <div v-if="showPassword">
    <Pass />
  </div>
  <div class="quiz">
    <h1>Quick Quiz</h1>
    <h4>Online Quiz System</h4><br>
    <h3>Select the category of quiz.</h3>
    <br>
    <div class="cats">
    <router-link  :to="`/Quiz/${category.automobile}`">Automobile</router-link>
    <router-link :to="`/Quiz/${category.geography}`">Geography</router-link>
    <router-link :to="`/Quiz/${category.pakistan}`">Pakistan</router-link>
    </div>
    <div class="admin">
      <button @click="showPass">Admin</button>
    </div>
  </div>
</template>

<script>
import Pass from '../components/Pass.vue'
export default {
    components: { Pass },
  
  data(){
    return{
      category:{
        "automobile": 'automobile',
        "geography": 'geography',
        "pakistan": 'pakistan',
      },
      showPassword: false
    }
  },
  methods: {
    showPass(){
      this.showPassword = true
    },
    hidePass(){
      this.showPassword = false
    }
  },
  mounted(){
    this.showPassword = false
  }
}
</script>
<style scoped>

h1{
  text-transform: capitalize;
  margin-top: 100px;
}
.cats{
  margin: 20px auto;
}
.admin{
  position: absolute;
  bottom: 40px;
  right: 50px;
}
.admin button{
  text-decoration: none;
  color: black;
  padding: 10px 20px;
  margin:10px 30px;
  background: rgb(255, 32, 32);
  border-radius: 10px;
  font-weight: bold;
  cursor: pointer;
}
.cats a{
  text-decoration: none;
  color: black;
  padding: 10px 20px;
  margin:10px 30px;
  background: yellowgreen;
  border-radius: 10px;
  font-weight: bold;
}

</style>