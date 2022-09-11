import './TopNavBar.css';

import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'

import HomePage from './HomePage/HomePage';
import Login from "./Login/Login";
import Create from './NewAccount/Create';
import Game from './Gameplay/Game';
import DeadHeros from './Login/DeadHeros';




function TopNavBar (){

    return(
    <Router>
    <div class="wrapper">


    <ul id='tablink'>      
        <li class='link'>
            <Link to="/" class='links'>Home</Link>
        </li>
        <li class='link'>
            <Link to="Login" class='links'>Login</Link>
        </li>
        <li class='link'>
            <Link to="Create" class='links'>Create Account</Link>
        </li>
        <li class='link'>
            <Link to="Game" class='links'>Game</Link>
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
    </div>
  </Router>
  )
}
export default TopNavBar