import React, {useState, useEffect} from 'react';
import { BrowserRouter, BrowserRouter as Router, Route, Routes, Link, useMatch } from 'react-router-dom'


function Game (){

    const [loot, setLoot] = useState([])
    const [characters, setCharacters] = useState([])
    const [gameData , setGameData] = useState([])
    const [loggedInUser, setLoggedInUser] = useState(null)
    const [error, setError] = useState([])

    console.log(gameData)
    useEffect(() => {
        fetch("/userInSession").then((response) => {
          if (response.ok) {
            response.json().then((user) => {
            setLoggedInUser(user)
            });
          }
        });
      }, []);

      useEffect(() => {
        fetch("/alive").then((response) => {
          if (response.ok) {
            response.json().then((data) => {
            setCharacters(data)
            });
          }
        });
      }, []);


    const gameOptions = [
        { label: "Pick Carefully", value: '0'},
        { label: 'Old World', value: '1' },
        { label: 'Dragon Hoard', value: '2' },
        { label: 'Save The Princess', value: '3' },
    ];

    const handleChange = (event) => {
        event.preventDefault()
        console.log(event.target.form[0].value, event.target.form[1].value);
        fetch('/current_rounds', {
            method: 'POST', 
            headers: {
              'Content-Type': 'application/json',
            },
            body: JSON.stringify({game_id:event.target.form[0].value, character_id:event.target.form[1].value}),
          })
          .then((response) =>{
            if (response.ok){
              response.json().then((data) => {
              setGameData(data)
          })
            }
            else{
              response.json().then((data) => {
                setError(data)
            })
            }
          }
        )
    };
    function turnAdvance(){
      fetch('/nextTurn', {
        method: 'POST', 
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({game_id:gameData[0].game.id, character_id:gameData[0].character.id, enemy_id: gameData[1].id}),
      })
      .then((response) =>{
        if (response.ok){
          response.json().then((data) => {
          setGameData(data)
          setLoot(data[2].gear)
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




    function ifLoggedIn(){
      if (gameData.length < 1){
        return(
         
            <div>
                <h1>where it starts</h1>
                <form>
                <label>
                    What Quest Do You Choose
                    <select>
                    {gameOptions.map((option) => (
                    <option key={option.value} value={option.value}>{option.label}</option>
                    ))}
                </select>
                </label>
                <label>
                    What Character Do You Choose
                    <select>
                        {characters.map((chara) => (
                        <option key={chara.id} value={chara.id}>{chara.name}</option>
                        ))}
                    </select>
                </label>
                <button onClick={handleChange}>Start Game</button>
                </form>
            </div>
        )
      }
        else {
          console.log(loot)
          if (gameData[0].character.health > 0 && gameData[0].game.round < 12){
            return(
              <div>
              <h1>{gameData[0].character.name} adventure</h1>
              <h2>health: {gameData[0].character.health} Power: {gameData[0].character.power} Defence: {gameData[0].character.defence}</h2>
              <p>{gameData[0].encounter.plot} {gameData[1].name}</p>
              <button type='button' onClick={turnAdvance}>Continue</button>
              <p>{loot.name}</p>
              </div>
            )
          }
          else if (gameData[0].character.health > 0 && gameData[0].game.round == 12){
            return(
              <div>
                <p>you won</p>
              </div>
            )
          }
          else{
            return(
              <div>
                <h1>gameover</h1>
              </div>
            )
          }

        } 
    }

    function ifNoUserFound(){
        return(
            <h1>please login to play game</h1>
        )
    }
    

    return(
        <div>
            {loggedInUser ? ifLoggedIn(): ifNoUserFound()}
        </div>
    )

}

export default Game