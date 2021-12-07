<template>
  <div v-if="queEdit">
      <EditQue :id="id"/>
  </div>
  <h1>Update or Delete a Question</h1>
  <select v-model="category" @click="load">
      <option>automobile</option>
      <option>geography</option>
      <option>pakistan</option>
  </select>
  <div>
  <table id="qq">
      <tr class="labelRow">
          <td>ID</td>
          <td>Question</td>
          <td>Actions</td>
      </tr>
      <tr v-for="item in ques" :key="item.id">
          <td>{{item.id}}</td>
          <td>{{item.question}}</td>
          <td> <span @click="editVisible(item.id)">Edit </span> | 
          <span @click="deleteQ(item.id)">Remove</span> </td>
      </tr>
  </table>
  </div>
  <router-link to="/Admin">Back</router-link>
</template>

<script>
import axios from 'axios'
import EditQue from '../components/EditQue.vue'
export default {
    components: {EditQue},
    data(){
        return{
            category: 'automobile',
            ques: [],
            queEdit: false,
            id: null
        }
    },
    methods: {
        load(){
            let result =  axios.get("http://127.0.0.1:8000/api/get/"+this.category)
            result.then(res =>{
            this.ques = res.data
            })
        },
        editVisible(id){
            this.id = id
            this.queEdit = true
        },
        hide(){
            this.queEdit = false
        },
        async deleteQ(id){
            await axios.delete("http://127.0.0.1:8000/api/remove/"+id)
            window.location.reload()
        }
           
    },
    mounted(){
        this.queEdit = false
        this.load()
    }
    
}
</script>

<style scoped>
select{
    margin-bottom: 20px;
    padding: 10px 20px;
    font-weight: bold;
    border: none;
    border-radius: 20px;
    background: rgb(209, 209, 209);
}
#qq{
    margin-bottom: 50px;
}
table{
    text-align: center;
    border: 1px solid black;
    margin: 0px auto;
    background: rgb(221, 221, 221);
}
td{
    padding: 10px 50px;
}
.labelRow{
    font-weight: bold;
    font-size: 1.5rem;
    color: black;
}
span{
    font-weight: bold;
    cursor: pointer;
}
a{
    text-decoration: none;
    font-weight: bold;
    color: yellowgreen;
    background: black;
    padding: 10px 20px;
    border-radius: 20px;

}
</style>