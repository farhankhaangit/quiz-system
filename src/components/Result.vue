<template>
  <div class="result">
      <div class="resultBox">
          <h1>Quiz Done</h1>
          <h3> Your Score: {{this.res}} out of {{total}}</h3>
          <router-link  to="/"> OK </router-link>
          <p @click="toggleDetailsVisibility"><span v-if="showDetails">--Hide Details--</span>
          <span v-else>--Show Details--</span></p>
          <div class="detail" v-if="showDetails">
              <table>
                  <tr class="labels-row">
                      <td>Question</td>
                      <td>Your Answer</td>
                      <td>Correct Answer</td>
                      <td>Status</td>
                  </tr>
                  <tr v-for="index in total" :key="index">
                      <td>{{questions[index-1]}}</td>
                      <td>{{answers[index-1]}}</td>
                      <td>{{correctAnswers[index-1]}}</td>
                      <td><span v-if="remark[index-1]">
                          <i class="fas fa-check" style="color: green; font-size: 25px"></i>
                          </span>
                          <span v-else>
                          <i class="fas fa-times" style="color: red; font-size: 25px"></i>
                          </span></td>
                  </tr>
              </table>
          </div>
      </div>
  </div>
</template>

<script>
export default {
    props: ['res','total','answers','correctAnswers','questions','remark'],
    data(){
        return{
            showDetails: false
        }
    },
    methods: {
        toggleDetailsVisibility(){
            this.showDetails = !this.showDetails
        }
    },
    mounted(){
        this.showDetails = false
    }
}
</script>

<style scoped>
.result{
    width: 100%;
    min-height: 100%;
    background: rgba(0, 0, 0, 0.349);
    position: absolute;
}
.resultBox{
    margin: 180px 100px;
    width: auto;
    padding: 30px 80px ;
    background: white;
    border-radius: 20px;
}
a{
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    font-weight: bold;
    background: yellowgreen;
    cursor: pointer;
    text-decoration: none;
    color: black;
}
p{
    cursor: pointer;
    margin: 20px auto;
}
table{
    border: none;
    margin: 0px auto;
    background: transparent;
}
td{
    padding: 10px 20px;
}
.labels-row{
    font-weight: bold;
    font-size: 1.5rem;
    color: black;
}
h3,h1, .detail{
    margin: 20px auto;
}
</style>