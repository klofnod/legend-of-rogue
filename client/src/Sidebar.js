import { BrowserRouter, BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'
import React, {useState, useEffect} from 'react';
import HomePage from './HomePage';
import Login from "./Login";
import Create from './Create';
import Game from './Game';
import DeadHeros from './DeadHeros';


function Sidebar (){

    return(
    <Router>

    <ul>      
        <li>
            <Link to="/">Home</Link>
        </li>
        <li>
            <Link to="Login">Login</Link>
        </li>
        <li>
            <Link to="Create">Create Account</Link>
        </li>
        <li>
            <Link to="Game">Game</Link>
        </li>
    </ul>


    <Routes>

        <Route exact path="/"      element={<HomePage />}/>
        <Route exact path="Login" element={<Login />}>
            <Route path="Fallen" element={<DeadHeros />} />
        </Route>
        <Route exact path="Create" element={<Create />}/>
        <Route exact path="Game" element={<Game />}/>



    </Routes>

  </Router>
  )
}
export default Sidebar