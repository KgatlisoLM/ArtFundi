<template>
  <TransitionRoot appear :show="isOpen" as="template">
    <Dialog as="div" className="relative z-10" @close="handleCloseModal">
      <TransitionChild as="template" enter="ease-out duration-100" enterFrom="opacity-0" enterTo="opacity-100"
        leave="ease-in duration-200" leaveFrom="opacity-100" leaveTo="opacity-0">
        <div className="fixed inset-0 bg-black bg-opacity-25" />
      </TransitionChild>

      <div className="fixed inset-0 overflow-y-auto">
        <div className="flex min-h-full items-center justify-center p-4 text-center">
          <TransitionChild as="template" enter="ease-out duration-300" enterFrom="opacity-0 scale-95"
            enterTo="opacity-100 scale-100" leave="ease-in duration-200" leaveFrom="opacity-100 scale-100"
            leaveTo="opacity-0 scale-95">
            <DialogPanel
              className="w-full max-w-xl transform overflow-hidden rounded-2xl bg-white p-6 text-left align-middle shadow-xl transition-all">
              <DialogTitle as="h3"
                className="text-lg font-medium leading-6 text-gray-900 flex justify-between items-center">
                Add Client
                <div @click="handleCloseModal">
                  <XCircleIcon class="w-8 h-8  hover:text-red-500 cursor-pointer" />
                </div>
              </DialogTitle>
              <ul v-if="Object.keys(this.errorList).length > 0">
                 <li class="text-red-500" v-for="(error, index) in this.errorList" :key="index">
                    {{ error[0]  }}
                 </li>
              </ul>
              <!-- <input v-model="model.client.uuid" type="hidden"/> -->
              <div class="flex mt-1 gap-4 justify-center">
                <input class="p-2 mt-8  rounded-sm border focus:outline-none w-full" v-model="model.client.firstName" type="text" name="firstName"
                  placeholder="First Name" />
                <input class="p-2 mt-8  rounded-sm border focus:outline-none w-full" type="text" v-model="model.client.lastName"  name="lastName"
                  placeholder="Last Name" />
              </div>
              <div class="mt-1 gap-4">
                <input class="p-2 mt-8  rounded-sm border focus:outline-none w-full" type="email" v-model="model.client.emailAddress" name="emailAddress"
                  placeholder="Email Address" />
              </div>
              <div class="mt-1 gap-4">
                <input class="p-2 mt-8  rounded-sm border focus:outline-none w-full" type="text" v-model="model.client.telephone" name="telephone"
                  placeholder="Telephone" />
              </div>
              <div class="mt-1 gap-4">
                <input class="p-2 mt-8  rounded-sm border focus:outline-none w-full" type="text" v-model="model.client.id_number" name="idNumber"
                  placeholder="ID Number" />
              </div>
              <div class="flex gap-4 justify-center">
                <VueDatePicker 
                v-model="model.client.dateOfBirth" 
                class="mt-10"
                type="date"
                format="yyyy/MM/dd"
                value-format="yyyy/MM/dd"
                :enableTimePicker="false"
                teleport-center="false"
                ></VueDatePicker>
              </div>
              <div class="mt-10">
                <div class="relative h-10 w-full min-w-[200px]">
                  <select v-model="model.client.status"
                     class="peer h-full w-full rounded-[2px] border border-blue-gray-200 border-t-transparent bg-transparent px-3 py-2.5 font-sans text-sm font-normal text-blue-gray-700 outline outline-0 transition-all placeholder-shown:border placeholder-shown:border-blue-gray-200 placeholder-shown:border-t-blue-gray-200 empty:!bg-gray-900 focus:border-2 focus:border-gray-900 focus:border-t-transparent focus:outline-0 disabled:border-0 disabled:bg-blue-gray-50">
                    <option value="1">Active</option>
                    <option value="0">DeActive</option>
                  </select>
                  <label
                    class="before:content[' '] after:content[' '] pointer-events-none absolute left-0 -top-1.5 flex h-full w-full select-none text-[11px] font-normal leading-tight text-blue-gray-400 transition-all before:pointer-events-none before:mt-[6.5px] before:mr-1 before:box-border before:block before:h-1.5 before:w-2.5 before:rounded-tl-md before:border-t before:border-l before:border-blue-gray-200 before:transition-all after:pointer-events-none after:mt-[6.5px] after:ml-1 after:box-border after:block after:h-1.5 after:w-2.5 after:flex-grow after:rounded-tr-md after:border-t after:border-r after:border-blue-gray-200 after:transition-all peer-placeholder-shown:text-sm peer-placeholder-shown:leading-[3.75] peer-placeholder-shown:text-blue-gray-500 peer-placeholder-shown:before:border-transparent peer-placeholder-shown:after:border-transparent peer-focus:text-[11px] peer-focus:leading-tight peer-focus:text-gray-900 peer-focus:before:border-t-2 peer-focus:before:border-l-2 peer-focus:before:border-gray-900 peer-focus:after:border-t-2 peer-focus:after:border-r-2 peer-focus:after:border-gray-900 peer-disabled:text-transparent peer-disabled:before:border-transparent peer-disabled:after:border-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500">
                    Select Status
                  </label>
                </div>
              </div>
              <div class="mt-5">
                <button @click="Submit" class="bg-[#301107] text-white rounded-md py-2 px-6 hover:scale-105 duration-300">Create</button>
              </div>

            </DialogPanel>
          </TransitionChild>
        </div>
      </div>
    </Dialog>
  </TransitionRoot>
</template>

<script>
import { XCircleIcon } from '@heroicons/vue/24/solid';
import axios from "axios";
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';
import { toast } from 'vue3-toastify';
import 'vue3-toastify/dist/index.css';


export default {
  props: {
    btnOpenClick: {
      type: Function
    },
    btnCloseClick: {
      type: Function
    },
    isOpen: {
      type: Boolean
    },
    uuid: {
      type: String
    },
    getClients: {
      type: Function
    }
  },

  components: {
    VueDatePicker
  },

  data() {
    return {
      errorList: '',
      model: {
        client: {
          uuid: crypto.randomUUID(),
          id_number: '',
          dateOfBirth: '',
          firstName: '',
          lastName: '',
          emailAddress: '',
          telephone: '',
          status: Number
        }
      }
    }
  },

  methods: {

     

      Submit() {
         var $this = this;
         axios.post('http://127.0.0.1:8000/api/clients', this.model.client)
         .then(res => {

            console.log(res.data);
             toast(res.data.message, {
               autoClose: 3000,
               type: 'success',
               theme: 'dark'
             });

          Object.assign(this.$data, this.$options.data());

          this.getClients();

          this.btnCloseClick();

         }).catch((error) =>{

             if(error.response) {
                 if(error.response.status == 422) {
                    $this.errorList = error.response.data.errors
                 };
             }else if(error.request){
                    console.log(error.request);
             }else{
                console.log('Error', error.message);
             }     
         });
      },

      handleCloseModal() {
        Object.assign(this.$data, this.$options.data());
        this.btnCloseClick();
      },

  },

}

</script>

<script setup>
import {
  Dialog,
  TransitionRoot,
  TransitionChild,
  DialogPanel,
  DialogTitle,
} from '@headlessui/vue';



</script>