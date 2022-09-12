import React, {useState, useEffect} from 'react';
import { BrowserRouter, BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'
import DeadHeros from './DeadHeros';
import './Login.css'
import logo from '../ArtAssets/v2.gif'

function Login(){
    const [userName, setUserName] = useState("")
    const [password, setPassword] = useState("")
   
    const [characters, setCharacters] = useState([])
    const [loggedInUser, setLoggedInUser] = useState(null)
    const [error, setError] = useState([])
  console.log(loggedInUser)

    useEffect(() => {
        fetch("/userInSession").then((response) => {
          if (response.ok) {
            response.json().then((user) => {
            setLoggedInUser(user)
            });
          }
        });
      }, []);

    function HandleLogin(e){
  
      e.preventDefault()
      fetch('/login', {
        method: 'POST', 
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({username:userName, password:password}),
      })
      .then((response) =>{
        if (response.ok){
          response.json().then((data) => {
          setLoggedInUser(data)
      })
        }
        else{
          response.json().then((data) => {
            setError(data)
        })
        }
      }
    )
    }

    function handleLogout(e){
        e.preventDefault()
          fetch(  "/logout" , 
          { method: "DELETE" })
          .then( r => r.json())
          .then( deleteResponse =>{
              setLoggedInUser(null)
              setCharacters([])
          })
        }
    
    function loginButton (){
        return(
            <div id='loginScreen'>
              <h2>Login Here To Begin Your Adventures</h2>
            <form onSubmit={HandleLogin}>
            <input
              type="text"
              value={userName}
              onChange={(e) => setUserName(e.target.value)}
            />
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
            <button type="submit">Login</button>
          </form>
          </div>
        )
    }

    const [loot, setLoot] = useState([])
    function chestSpawn(e){
        fetch('/chests', {
          method: 'POST', 
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({character_id:e.target.name}),
        })
        .then((response) =>{
          if (response.ok){
            response.json().then((data) => {
            setLoot(data.gear);
        })
          }
          else{
            response.json().then((data) => {
              setError(data)
          })
          }
        }
      )
      }

    function LogoutButton(){

        function CreateCharacter(e){
            e.preventDefault()
            console.log(e.target[0].value, e.target[1].value )
            fetch('/characters', {
              method: 'POST', 
              headers: {
                'Content-Type': 'application/json',
              },
              body: JSON.stringify({name:e.target[0].value, backstory:e.target[1].value, combatant_id:loggedInUser.id}),
            })
            .then((response) =>{
              if (response.ok){
                response.json().then((data)=> {
                  setCharacters(data)
                })
              }
              else{
                response.json().then((data) => {
                  setError(data)
              })
              }
            }
          )
          }
        return(
            <div >
              <div id='topButtons'>
            <Link to="Fallen">
              <button id='fallen' type='button'>Fallen Heros</button>
            </Link>
            <h1 id='loginHeader'>Create And View Alive Characters</h1>
            <button id='logout' onClick={handleLogout}>Logout</button>
            </div>
            <form id='createCharaForm' onSubmit={CreateCharacter}>
            <input className='inputField'
              type="text"
              name="characterName"
            />
            <textarea className='inputField' id='backstory'
              type="text"
              name="backstory"
            />
            <button id='createCharaButton' type='submit'>Create Character</button>
          </form>

          <Routes>
              <Route path="Fallen" element={<DeadHeros />} />
            </Routes>
          </div>
          
        )
    }
    useEffect(() => {
        fetch("/alive").then((response) => {
          if (response.ok) {
            response.json().then((data) => {
            setCharacters(data)
            });
          }
        });
      }, [loot, loggedInUser]);

    const ListOfAlive = characters.map((each)=>{
        return(
            <div className='listOfCharas' key={each.id} style={{ backgroundImage:`url(${logo})` }} >
            <h1 className='charaName'>{each.name}</h1>
            <p className='charaBackstory'>Backstory: {each.backstory}</p>
            <p className='stat'>Health: {each.health}</p>
            <p className='stat'>Power: {each.power}</p>
            <p className='stat'>Defence: {each.defence}</p>
            <button name={each.id} onClick={chestSpawn}>chest</button>
            </div>
        )
    })
    
    
    
    
    console.log(loot)
    console.log(characters)
    
    return(


        <div className="login">

            {loggedInUser ? LogoutButton() : loginButton()}
            {ListOfAlive}

        </div>
    )
}

export default Login