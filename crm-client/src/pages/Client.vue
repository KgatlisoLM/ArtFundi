<template>
  <div class="border border-gray-200 w-full h-auto rounded-md p-5 shadow-md overflow-x-auto mt-10">
    <div class="d-flex w-full h-16">
      <h2 class="text-2xl font-semibold">Clients</h2>
      <p class="font-medium">Total number of clients: {{ this.clients.length }}</p>
    </div>
    <div class="flex w-full h-10 justify-between">
      <div class="hidden sm:flex items-center h-10 rounded-md border w-96 cursor-pointer mb-5">
        <input class="p-2 h-full w-6 flex-grow flex-shrink rounded-1-md focus:outline-none px-4"
          placeholder="Search for clients..." type="text" name="search" v-model="searchValue" />
        <MagnifyingGlassIcon class="h-12 p-4" />
      </div>
      <div class="flex gap-x-2">
        <div @click="handleCreate" class="flex items-center cursor-pointer gap-x-2 middle none center rounded-md bg-[#301107] py-3 px-6 font-sans text-xs font-bold 
                  text-white shadow-md  shadow-gray-500/20  transition-all hover:shadow-lg  hover:shadow-gray-500/40 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] 
                  active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">
          <PlusIcon class="w-6 h-6" />
          Add Clients
        </div>
      </div>
    </div>
    <div class="block w-full mt-10 mb-5">
      <table class="items-center bg-transparent w-full border-collapse mb-5 overflow-x-auto overflow-y-auto">
        <thead>
          <tr>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              UUID
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              ID Number
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              Date Of Birth
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              First Name
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              Last Name
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              Email Address
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              Telephone
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              Status
            </th>
            <th
              class="px-6 bg-blueGray-50 text-blueGray-500 align-middle border border-solid border-blueGray-200 py-3 text-sm uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold">
              Actions
            </th>
          </tr>
        </thead>
        <tbody v-if="this.clients.length > 0">
          <tr v-for="(client, index) in paginatedItems" :key="index">
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0  whitespace-nowrap p-4 text-base font-medium uppercase">
              {{ client.UUID }}
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0 text-base font-medium uppercase whitespace-nowrap p-4">
              {{ client.ID_Number }}
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0 text-base font-medium uppercase whitespace-nowrap p-4">
              {{ client.DateOfBirth }}
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0  text-base font-medium uppercase whitespace-nowrap p-4">
              {{ client.FirstName }}
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0  text-base font-medium uppercase whitespace-nowrap p-4">
              {{ client.LastName }}
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0 text-base font-medium uppercase whitespace-nowrap p-4">
              {{ client.EmailAddress }}
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0 text-base font-medium uppercase whitespace-nowrap p-4">
              {{ client.Telephone }}
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0 text-base font-medium uppercase whitespace-nowrap p-4">
              <span v-if="client.Status == 1" class=" bg-green-200 p-2 rounded-lg text-green-800 text-xs font-semibold">
                Active
              </span>
              <span v-else class="bg-red-200 p-2 rounded-lg text-red-800 text-xs font-semibold">
                DeActive
              </span>
            </td>
            <td
              class="border-t-0 px-6 text-center border-l-0 border-r-0 text-base font-medium uppercase whitespace-nowrap p-4">
              <div class="flex gap-x-4 justify-center">
                <router-link :to="{ path: '/clients/edit/' + client.id }">
                  <PencilSquareIcon class="w-6 h-6 cursor-pointer text-yellow-500 hover:text-yellow-800" />
                </router-link>
                <span @click="deleteClient(client.id)">
                  <TrashIcon class="w-6 h-6 cursor-pointer text-red-500 hover:text-red-800" />
                </span>

              </div>
            </td>
          </tr>
        </tbody>
        <tbody v-else-if="this.clients.length == 0">
          <tr>
            <td class="text-center font-semibold py-5" colspan="9">No Data</td>
          </tr>
        </tbody>
        <tbody v-else>
          <tr>
            <td class="text-center font-semibold animate-pulse py-5" colspan="9">Loading...</td>
          </tr>
        </tbody>
      </table>
      <div class="flex items-center gap-4 border-t-2 p-2">
        <button @click="prevPage" :disabled="currentPage === 1"
          class="flex items-center gap-2 px-6 py-3 font-sans text-xs font-bold text-center text-gray-900 uppercase align-middle transition-all rounded-lg select-none hover:bg-gray-900/10 active:bg-gray-900/20 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
          type="button">
          <ArrowLeftIcon class="w-6 h-6" />
          Previous
        </button>
        <div class="flex items-center gap-2">
          <span>{{ currentPage }} / {{ totalPages }}</span>
        </div>
        <button @click="nextPage"   :disabled="currentPage === totalPages"
          class="flex items-center gap-2 px-6 py-3 font-sans text-xs font-bold text-center text-gray-900 uppercase align-middle transition-all rounded-lg select-none hover:bg-gray-900/10 active:bg-gray-900/20 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
          type="button">
          Next
          <ArrowRightIcon class="w-6 h-6" />
        </button>
      </div>
    </div>

  </div>

  <AddModal :isOpen="isOpen" :btnCloseClick="this.onCloseModal" :getClients="this.getClients" />
</template>


<script>
import { ArrowDownLeftIcon, ArrowLeftIcon, ArrowRightIcon, MagnifyingGlassIcon, PencilSquareIcon, PlusIcon, TrashIcon } from '@heroicons/vue/24/outline';
import AddModal from '../components/AddModal.vue';
import axios from 'axios';
import 'vue3-toastify/dist/index.css';

export default {

  components: {
    MagnifyingGlassIcon,
    PlusIcon,
    PencilSquareIcon,
    TrashIcon,
    AddModal,
    ArrowDownLeftIcon,
    ArrowLeftIcon,
    ArrowRightIcon
  },

  data: function () {
    return {
      searchValue: '',
      isOpen: false,
      clients: [],
      itemsPerPage: 5,
      currentPage: 1

    }

  },

  mounted() {
    this.getClients();
  },


  methods: {
    handleCreate() {
      this.isOpen = true;
    },

    getClients() {

      axios.get('http://127.0.0.1:8000/api/clients').then(res => {
        this.clients = res.data.clients
      })
    },

    onCloseModal() {
      this.isOpen = false;
    },

    deleteClient(clientId) {
      if (confirm('Are you sure, you want to delete this client?')) {
        //console.log(clientId);
        axios.delete(`http://127.0.0.1:8000/api/clients/delete/${clientId}`).then(res => {

          toast(res.data.message, {
            autoClose: 3000,
            type: 'success',
            theme: 'dark'
          });
        });
        this.getClients();
      }

    },

    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
      }
    },

    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },

  },

  computed: {
    filteredList() {
      return this.clients.filter(client => {
        return client.FirstName.toLowerCase().includes(this.searchValue.toLowerCase()) ||
          client.LastName.toLowerCase().includes(this.searchValue.toLowerCase()) ||
          client.ID_Number.toLowerCase().includes(this.searchValue.toLowerCase()) ||
          client.EmailAddress.toLowerCase().includes(this.searchValue.toLowerCase()) ||
          client.Telephone.toLowerCase().includes(this.searchValue.toLowerCase())
      });
    },

    totalPages() {
      return Math.ceil(this.filteredList.length / this.itemsPerPage);
    },

    paginatedItems() {
      const startIndex = (this.currentPage - 1) * this.itemsPerPage;
      return this.filteredList.slice(startIndex, startIndex + this.itemsPerPage);
    },
  },
}


</script>