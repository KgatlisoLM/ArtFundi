import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from "./router"



function loggedIn() {
    return localStorage.getItem('token')
}



createApp(App).use(router).mount('#app');
