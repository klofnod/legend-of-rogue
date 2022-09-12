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
    <div className="wrapper">


    <ul id='tablink'>      
        <li className='link'>
            <Link to="/" className='links'>Home</Link>
        </li>
        <li className='link'>
            <Link to="Login" className='links'>Login</Link>
        </li>
        <li className='link'>
            <Link to="Create" className='links'>Create Account</Link>
        </li>
        <li className='link'>
            <Link to="Game" className='links'>Game</Link>
        </li>
    </ul>


    <Routes>

        <Route exact path="/"      element={<HomePage />}/>
        <Route exact path="Login/*" element={<Login />}>
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