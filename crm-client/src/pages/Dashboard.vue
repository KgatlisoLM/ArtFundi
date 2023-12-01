<template>
     <div class="flex w-full h-auto justify-center mt-5">
       <img :src="art" alt="art"  class="rounded-2xl  h-[400px] w-[1500px] object-cover" />
     </div>
</template>

<script>
 import art from '../assets/images/art.jpg';
 
 export default {
      
     data: function() {
        return{
            art: art
        }
     }
 }

</script>