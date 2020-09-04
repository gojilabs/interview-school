import Http from './http';
import store from '../store';

export default class userApi {
  static login(userType) {
    return Http.post(
      `/users/login`, 
      {
        email: store.getters['auth/email'],
        password: store.getters['auth/password'],
      }
    ).then(
      success => {
      },
      fail => {
      }
    );
  }
}
