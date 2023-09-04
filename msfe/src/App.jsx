import React from 'react';
import { BrowserRouter as Router } from "react-router-dom";
import './App.css';
import "bulma/css/bulma.css";
import axios from "axios";
import Navbar from './layout/navbar.jsx';
import Footer from './layout/footer.jsx';
import AppRoutes from './app_routes/routes';
import { useEffect, useState } from 'react';
import apiRoutes from './api_routes/routes.json';

function getAPIServices() {
  return axios.get(apiRoutes.services.GET).then((response) => response.data)
}
function getAPICustomers() {
  return axios.get(apiRoutes.customers.GET).then((response) => response.data)
}

function App() {
  return (
    <Router>
      <div className="App" style={{textAlign: "left"}}>
        <header>
          <Navbar />
        </header>
        <main>
          <AppRoutes />
        </main>
        <footer>
          <Footer />
        </footer>
      </div>
      </Router>
  );
}

export default App;
