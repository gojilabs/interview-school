import axios from 'axios';
// import store from '../store';

const config = { baseURL: 'http://localhost:3000/api' };

// if (store.getters['auth/token']) {
//   config.headers = { "Authorization": store.getters['auth/token'] };
// }

export default axios.create(config);
