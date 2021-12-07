<template>
<div class="bg">
  <form>
      <h1>Update Question <span style="float: right; cursor: pointer;" @click="close"><i class="fas fa-times"></i></span></h1>
      <div class="question">
        <input type="text" placeholder="Enter Question" v-model="question" required> 
      </div>
      <div class="answers">
        <input type="text" placeholder="Enter Option a" v-model="optionA" required>
        <input type="text" placeholder="Enter Option b" v-model="optionB" required>
        <input type="text" placeholder="Enter Option c" v-model="optionC" required>
        <input type="text" placeholder="Enter Option d" v-model="optionD" required>
      </div>
      <select class="correct" v-model="correct" required>
          <option selected disabled>--Select Correct Option--</option>
          <option>{{optionA}}</option>
          <option>{{optionB}}</option>
          <option>{{optionC}}</option>
          <option>{{optionD}}</option>
      </select>
      <select v-model="category" class="select">
          <option selected disabled>--Select Category--</option>
          <option>automobile</option>
          <option>geography</option>
          <option>pakistan</option>
      </select>
      <button @click="submit">Update</button>
  </form>
  </div>
</template>

<script>
import axios from 'axios'
export default {
    props: ['id'],
    data(){
        return {
            question: '',
            optionA: '',
            optionB: '',
            optionC: '',
            optionD: '',
            correct: '',
            category: ''
        }
    },
    methods: {
        async load(){
            let record = await axios.get(`http://127.0.0.1:8000/api/get-single/${this.id}`)
            this.question = record.data[0].question
            this.optionA = record.data[0].optionA
            this.optionB = record.data[0].optionB
            this.optionC = record.data[0].optionC
            this.optionD = record.data[0].optionD
            this.correct = record.data[0].correctOption
            this.category = record.data[0].category
        },
        async submit(){
            let result = await axios.put("http://127.0.0.1:8000/api/edit",{
                id: this.id,
                question: this.question,
                optionA: this.optionA,
                optionB: this.optionB,
                optionC: this.optionC,
                optionD: this.optionD,
                correctOption: this.correct,
                category: this.category
            })
            if(result.data){
                this.$parent.hide()
            }
            
        },
        close(){
            this.$parent.hide()
        }
    },
     mounted(){
        this.load()
    }
}
</script>

<style scoped>
.bg{
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.425);
    padding: 80px auto;
    position: absolute;
    top: 0;
}
    form{
    margin: 100px auto;
    width: 800px;
    background: rgb(216, 216, 216);
    border-radius: 30px;
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



select, .select{
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
h1{
    margin-top: 0px;
    padding: 30px;
}
</style>