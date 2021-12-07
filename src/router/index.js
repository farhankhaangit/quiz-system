import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Quiz from '../views/Quiz.vue'
import Admin from '../views/Admin.vue'
import EditRemove from '../views/EditRemove.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/Quiz/:typ',
    name: 'Quiz',
    component: Quiz
  },
  {
    path: '/Admin',
    name: 'Admin',
    component: Admin
  },
  {
    path: '/EditRemove',
    name: 'EditRemove',
    component: EditRemove
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
