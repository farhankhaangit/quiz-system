<template>
<div class="result" v-if="displayResult">
      <Result  :res="score" :total="maxData" :answers="userAnswers" :correctAnswers="correctAnswers" :questions="questions" :remark="status"/>
    </div>
  <div class="Quiz">
    <h1>Quick Quiz</h1>
    <h4>Online Quiz System </h4>
    <h2>Time Remaining: {{countDown}}s</h2>
    <div class="question">
      <h3>{{this.question}}</h3>
  </div>
  <div class="options">
      <p @click="marker" v-for="option in options" :key="option">{{option}}</p>
  </div>
  
    <div class="back">
      <router-link to="/">Exit</router-link>
    </div> 
  </div>
</template>
<script>
import axios from 'axios'
import Result from '../components/Result.vue'
export default{
  components: { Result },

    data(){
        return{ 
        question : '',
        options: [],
        answer: '',
        userAnswers:[],
        correctAnswers:[],
        questions:[],
        status: [],
        quizData: [],
        score: 0,
        qNo: 0,
        maxData: 0,
        countDown: 10,
        timer: null,
        displayResult: false
        }
    },
    methods: {
      marker(e){
        this.userAnswers.push(e.target.innerText)
        if(e.target.innerText === this.answer){
            this.status.push(true)
            this.score++;
        }
        else{
            this.status.push(false)
        }
        this.load()
      },
      load(){
        if (this.qNo < this.maxData){ 
          this.countDown = 10
          clearTimeout(this.timer)
          this.countDownTimer()

          this.options.splice(0);
          this.question = this.quizData[this.qNo].question
          this.options.push(this.quizData[this.qNo].optionA)
          this.options.push(this.quizData[this.qNo].optionB)
          this.options.push(this.quizData[this.qNo].optionC)
          this.options.push(this.quizData[this.qNo].optionD)
          this.answer = this.quizData[this.qNo].correctOption

          this.questions.push(this.question)
          this.correctAnswers.push(this.answer)
          this.qNo++
        }
        else{
          clearTimeout(this.timer)
          this.displayResult = true
        }
      },
      shuffle(array) {
        let currentIndex = array.length,  randomIndex;

        // While there remain elements to shuffle...
        while (currentIndex != 0) {
          // Pick a remaining element...
          randomIndex = Math.floor(Math.random() * currentIndex);
          currentIndex--;
          // And swap it with the current element.
          [array[currentIndex], array[randomIndex]] = [
          array[randomIndex], array[currentIndex]];
          }
        return array;
      },
      countDownTimer() {
                if(this.countDown > 0) {
                    this.timer = setTimeout(() => {
                        this.countDown -= 1
                        this.countDownTimer()
                    }, 1000)
                }
                else{
                    this.userAnswers.push("-----------")
                    this.status.push(false)
                    this.load()
                }
            }
    },
    async mounted(){
      this.displayResult = false
      let file = await axios.get("http://127.0.0.1:8000/api/get/"+ this.$route.params.typ)
      this.quizData = file.data
      console.log("db quiz: ",this.quizData)
      this.maxData = file.data.length
      this.quizData = this.shuffle(this.quizData)
      this.load()

    }
}
</script>
<style scoped>

.back{
  margin-top: 50px;
}
.back a{
   text-decoration: none;
  color: yellowgreen;
  padding: 10px 20px;
  margin:0px 30px;
  background: black;
  border-radius: 10px;
  font-weight: bold;
}
.question{
    width: 700px;
    margin: 0px auto;
    border-radius: 20px;
    background: rgb(228, 228, 228);
}
.options{
    width: 300px;
    color: black;
    margin: 0 auto;
}
p{
    background: rgb(112, 112, 112);
    padding-top: 10px;
    padding-bottom: 10px;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
}
h3{
    color: rgb(112, 112, 112);
    padding: 30px 30px;

}

h1{
  margin-top: 0;
  padding-top: 50px ;
}
</style>
