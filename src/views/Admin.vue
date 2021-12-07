<template>
  <h1>Welcome Admin</h1>
  <br><h3>Enter New Question Details Down There</h3>
  
  <form>
      <div class="question">
        <input type="text" placeholder="Enter Question" v-model="question"> 
      </div>
      <div class="answers">
        <input type="text" placeholder="Enter Option a" v-model="optionA">
        <input type="text" placeholder="Enter Option b" v-model="optionB">
        <input type="text" placeholder="Enter Option c" v-model="optionC">
        <input type="text" placeholder="Enter Option d" v-model="optionD">
      </div>
      <select class="correct" v-model="correct" required>
          <option selected disabled>--Select Correct Option--</option>
          <option>{{optionA}}</option>
          <option>{{optionB}}</option>
          <option>{{optionC}}</option>
          <option>{{optionD}}</option>
      </select>
      <select v-model="category">
          <option selected disabled>--Select Category--</option>
          <option>automobile</option>
          <option>geography</option>
          <option>pakistan</option>
      </select>
      <button @click="submit">Add</button>
  </form>
  <router-link to="/EditRemove">Edit/Remove Question</router-link>
  <router-link to="/">Exit</router-link>
</template>

<script>
import axios from 'axios'
export default {
    data(){
        return{
            question: '',
            optionA: '',
            optionB: '',
            optionC: '',
            optionD: '',
            correct: '--Select Correct Option--',
            category: '--Select Category--'
        }
    },
    methods: {
        submit(){
            if(this.optionA != "" && this.optionB != "" &&
                this.optionC != "" && this.optionD != "" && this.question != ""){
            
                if(this.correct=='--Select Correct Option--' || this.category=='--Select Category--')
                {
                    alert("Plz select category or correct option")
                }
                else{
                    this.send()
                }
            }
            else{
                alert("Plz fill all options and question")
            }
        },
        async send(){
            let result = await axios.post("http://127.0.0.1:8000/api/add",{
                question: this.question,
                optionA: this.optionA,
                optionB: this.optionB,
                optionC: this.optionC,
                optionD: this.optionD,
                correctOption: this.correct,
                category: this.category
            });
            
            alert(result.data)
            window.location.reload()
            
        },
       
    },
    // mounted(){
    //     this.showPassword = true
    // }
}


</script>

<style scoped>
form{
    margin: 20px auto;
    width: 800px;
    background: rgb(216, 216, 216);
    border-radius: 30px;
}
.question{
    padding-top: 30px;
}
.question input{
    width: 80%;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
}
.question input::placeholder{
    font-weight: bold;
    font-size: 15px;
    color: rgb(129, 129, 129);
}
.answers{
    padding-top: 20px;
}
.answers input{
    width: 60%;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    display: block;
    margin: 5px auto ;
}



select{
    width: 30%;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    margin: 5px auto ;
    margin-right: 50px;
}
button{
    padding: 10px 20px;
    font-weight: bold;
    border-radius: 10px;
    border: none;
    cursor: pointer;
    margin-bottom: 30px;
    margin-top: 20px;
    background: black;
    color: white;
}
a{
    padding: 10px 20px;
    font-weight: bold;
    border-radius: 10px;
    border: none;
    cursor: pointer;
    margin-bottom: 30px;
    margin-top: 20px;
    margin-right: 20px;
    background: yellowgreen;
    color: rgb(0, 0, 0);
    text-decoration: none;
}
h1{
    margin-top: 0px;
    padding: 30px;
}
</style>