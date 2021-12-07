<template>
  <div class="result">
      <div class="resultBox">
          <div>
          <input type="password" placeholder="Enter Admin Password" v-model="pass">
          <p style="color: red;" v-show="alert">Wrong Password, Try Again</p>
          <input type="button" value="OK" @click="check">
          </div>
          <button @click="hide">Cancel</button>
      </div>
      
  </div>
</template>

<script>
import axios from 'axios'
export default {
    data(){
        return{
            pass: '',
            alert: false
        }
    },
    methods: {
        check(){
            if(this.pass == '1234khan'){
                this.$router.push("/Admin")
            }
            else{
                this.toggleAlert()
            }
        },
        hide(){
            this.$parent.hidePass()
        },
        toggleAlert(){
            this.alert = true
        }
    }
}
</script>

<style scoped>
.result{
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.603);
    position: absolute;
    top: 0;
}
.resultBox{
    margin: 200px 400px ;
    padding: 30px 80px ;
    background: white;
    border-radius: 20px;
    position: relative;
}
.resultBox input{ 
    display: block;
    margin: 0 auto;
}
.resultBox input:first-child{
    background: rgb(199, 199, 199);
    color: rgb(134, 134, 134);
    border: none;
    border-radius: 20px;
    padding: 20px 30px;
    font-size: 20px;
    font-weight: bold;
}
.resultBox input:last-child{
    background: yellowgreen;
    color: rgb(2, 0, 0);
    border: none;
    border-radius: 10px;
    padding: 10px 20px;
    font-size: 15px;
    font-weight: bold;
    margin-top: 20px;
    cursor: pointer;
}
.resultBox button{
    color: rgb(0, 0, 0);
    border: none;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    position: absolute;
    bottom: 5px;
    right: 20px;
    text-decoration: none;
}
</style>