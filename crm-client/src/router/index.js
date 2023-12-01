import {createRouter, createWebHistory} from 'vue-router';
import Dashboard from '/src/pages/Dashboard.vue';
import Client from '/src/pages/Client.vue';
import ClientEdit from '/src/pages/Edit.vue';
import Login from '/src/pages/Login.vue';
import MainLayout from "/src/layout/MainLayout.vue";
import AuthLayout from '/src/layout/AuthLayout.vue';

const routes = [
    {
        path: '/',
        name: 'Public',
        component: MainLayout,
        redirect: '/',
        children: [
            {
                path: '/',
                name: 'Home',
                component: Dashboard
            },
            {
                path: '/clients',
                name: 'Client',
                component: Client
            },
            {
                path: '/clients/edit/:id',
                name: 'editClient',
                component: ClientEdit
            }
        ]
    },
    {
        path: '/Auth',
        name: 'Auth',
        component: AuthLayout,
        redirect: '/login',
        children: [
            {
                path: '/login',
                name: 'Login',
                component: Login
            }
        ]
    }
];


const router = createRouter({
    history: createWebHistory(),
    routes,
});

const isAuthenticated = localStorage.getItem('token');

router.beforeEach((to, from, next) => {
    if (to.name !== 'Login' && !isAuthenticated) next({ name: 'Login' })
    else next()
});



export default router;