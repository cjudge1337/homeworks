import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util';

  window.fetchSearchGiphys = fetchSearchGiphys;

// document.addEventListener("DOMContentLoaded", () => {
//   let root = document.getElementById("root");
//   ReactDOM.render(<Root />, root);
// });
