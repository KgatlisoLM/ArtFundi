<template>
    <div class="h-[50px] bg-[#44281f] flex justify-start items-center">
        <div class="px-[20px]">
           <h3 class="font-bold text-xl">
              Admin Dashboard
           </h3> 
        </div>
    </div>
    <div class="h-[calc(100vh-50px)] bg-[#594038] py-[20px]">
     <div class="px-[20px] flex flex-col justify-between space-y-[10px]">
            <router-link  to="/" exact-active-class="bg-[#82706a] font-semibold" class="inline-flex relative items-center font-medium py-[10px] px-[10px] w-full text-sm rounded-md  space-y-[10px] hover:bg-[#82706a]">
            <div class="flex justify-end items-end gap-3">
              <HomeIcon class="h-6 w-6"/>
              Home
            </div>
         </router-link>
         <router-link to="/clients" active-class="bg-[#82706a] font-semibold" class="inline-flex relative items-center font-medium py-[10px] px-[10px] w-full text-sm rounded-md space-y-[10px] hover:bg-[#82706a]">
            <div class="flex justify-end items-end gap-3">
               <UsersIcon class="h-6 w-6"/>
                Clients
            </div>
         </router-link>
        </div>
    </div>
</template>

<script >
 import { HomeIcon } from '@heroicons/vue/24/solid'
 import { UsersIcon } from '@heroicons/vue/24/solid'

 export default {
    components: {
    HomeIcon,
    UsersIcon
  },

 }

 

</script>