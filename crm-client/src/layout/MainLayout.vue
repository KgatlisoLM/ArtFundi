
<template>
    <div class="flex w-screen h-screen relative">
       <!-- Side bar -->
       <div v-show="showMobile" v-if="screenWidth < 1024" class="w-[300px] h-full text-white absolute">
        <div class="relative">
          <MobileNav/>
          <div @click="onHideMobile">
            <XMarkIcon class="h-9 w-9 p-2 absolute -right-4 top-10 bg-white z-40 shadow-lg rounded-full text-gray-900 cursor-pointer"/>
          </div>
        </div>
        
       </div>

       <div v-show="showSide" v-if="screenWidth > 1024" class="w-[400px] h-full bg-gray-200 text-white">
         <Sidebar/>
       </div>

      <div class="w-full h-full bg-[#82706a]">
        <div class="h-[50px] bg-[#ac9f9b] flex items-center shadow-sm px-[20px] w-full py-[10px] z-10 justify-between">
           <div class="cursor-pointer w-[30px]"  @click="toggleSideBar">
             <Bars3Icon class="w-6 h-6 text-white" />
           </div>
           <div class="w-[200px]">
                <div class="flex items-center justify-start space-x-4 p-2 cursor-pointer" @click="toggleDrop">
                   <div class="bg-[#44281f] h-10 w-10 rounded-full text-white p-2 text-center">
                     <span>A</span>
                   </div>
                  <div class="font-semibold text-white text-left">
                    <div class="text-sm">{{ currentUser.name }}</div>
                    <div class="text-xs text-white">{{ currentUser.email }}</div>
                  </div>
                </div>
                <div v-show="showDropDown" class="absolute right-[10px] z-10 mt-2 w-56 origin-top-right rounded-sm bg-white shadow-lg ring-1 ring-gray-200">
                  <div class="py-3 text-left px-2.5 text-sm font-medium cursor-pointer" role="none">
                    <div @click="logout" class=" hover:text-red-500 flex items-center gap-2" role="menuitem" tabindex="-1" id="menu-item-0">
                      <ArrowLeftOnRectangleIcon class="w-6 h-6"/>
                      Logout
                    </div>
                  </div>
                </div>
           </div>
        </div>
        <div class="h-[calc(100vh-50px)] bg-white p-5">
          <router-view/>
        </div>
      </div>
    </div>
</template>

<script>
import { ArrowLeftOnRectangleIcon, Bars3Icon, XMarkIcon} from '@heroicons/vue/24/solid';
import Sidebar from '../components/Sidebar.vue';
import MobileNav from '../components/MobileNav.vue';
import axios from 'axios';


  export default {
    components: {
    Sidebar,
    Bars3Icon,
    ArrowLeftOnRectangleIcon,
    MobileNav,
    XMarkIcon
},

    data() {
         return {
            showDropDown: false,
            showSide: true,
            showMobile: false,
            screenWidth: 0,
            currentUser: {},
            token: localStorage.getItem('token')
         }
    },

    mounted() {
       this.updateScreenWidth();
       this.onScreenResize();
       this.onResizeHide();
    },

    created() {
       axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
       axios.get('http://127.0.0.1:8000/api/user').then((res) => {
         this.currentUser = res.data
       }).catch((errors) => {
          console.log(errors)
       });
    },

  methods: {
      toggleSideBar() {
         if(this.screenWidth > 1024){
          this.showSide = !this.showSide
         }else {
            this.showMobile = true
         }
         
       },
       toggleDrop() {
         this.showDropDown = !this.showDropDown
       },

     onScreenResize() {
      window.addEventListener("resize", () => {
        this.updateScreenWidth();
      });
    },
    updateScreenWidth() {
      this.screenWidth = window.innerWidth;
     },
      
     onResizeHide() {
        if(this.screenWidth > 1024){
           this.showSide = true
        }else{
           this.showSide = false
        }
     },

     onHideMobile() {
        this.showMobile = false
     },

     logout() {
        axios.post('http://127.0.0.1:8000/api/logout').then((response) => {
          localStorage.removeItem('token')
          this.$router.push('/login')
        }).catch((errors) => {
          console.log(errors)
        });
     }
 
    }
  }



</script>