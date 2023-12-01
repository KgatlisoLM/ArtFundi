<template>
     <section class="bg-gray-50 min-h-screen flex items-center justify-center">
         <div class="flex shadow-md rounded-sm max-w-3xl bg-gray-200/50 items-center">
            <!-- form -->
            <div class="sm:w-1/2 px-16">
              <h2 class="font-bold text-2xl ">Login</h2>
              <p class="text-sm mt-4">If you already have an account, sign in</p>
            
               <div class="flex flex-col gap-4">
                  <input class="p-2 mt-8  rounded-sm border focus:outline-none" type="text" name="email" v-model="formData.email" placeholder="Email"/>
                   <p class="text-red-500" v-text="errors.email"></p>
                  <div class="relative">
                    <input v-if="passHidden" class="p-2 rounded-sm border w-full pr-8 focus:outline-none" type="password" name="password" placeholder="Password" v-model="formData.password" />
                    <input v-else="!passHidden" class="p-2 rounded-sm border w-full pr-8 focus:outline-none" type="text" name="password" placeholder="Password" v-model="formData.password"/>
                    <div @click="toggleEye">
                      <EyeSlashIcon v-if="passHidden"  class="w-4 h-4 absolute top-1/2 right-3 -translate-y-1/2 text-gray-400 cursor-pointer"/>
                      <EyeIcon v-else="!passHidden"  class="w-4 h-4 absolute top-1/2 right-3 -translate-y-1/2 text-gray-400 cursor-pointer"/>
                    </div>
                  </div>
                  <p class="text-red-500" v-text="errors.password"></p>
                  <button  @click="Submit" class="bg-[#301107] text-white rounded-sm py-2 hover:scale-105 duration-300">Login</button>
                  <p v-if="status === 400" class="text-red-500" v-text="errors"></p>
              </div>
            </div>

             <!-- image -->
             <div class="sm:block hidden  w-1/2 p-5">
                <img :src="loginArt" alt="login" class="rounded-sm"/>
             </div>
         </div>
     </section>
</template>

<script>
import loginArt from '../assets/images/loginArt.jpg';
import {EyeIcon, EyeSlashIcon} from "@heroicons/vue/24/outline";
import axios from "axios";

  export default {

    components: {
      EyeIcon,
      EyeSlashIcon
    },

    data: function () {
      return {
        loginArt: loginArt,
        passHidden: true,
        formData: {
           email: '',
           password: '',
           device_name: 'browser'
        },
        errors: '',
        status: Number

        
      }
   },

   methods: {
     toggleEye() {
       this.passHidden = !this.passHidden
     },

     Submit() {
        axios.post('http://127.0.0.1:8000/api/login', this.formData).then((res) => {
         localStorage.setItem('token', res.data)
         this.$router.push('/');
        }).catch((errors) => {
          this.errors = errors.response.data.errors;
          this.status = errors.response.data.status
        });
     }
   }


}

</script>