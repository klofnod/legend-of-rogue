import React, {useState, useEffect} from 'react';
import { BrowserRouter, BrowserRouter as Router, Route, Routes, Link, useMatch } from 'react-router-dom'
import GameBoard from '../GameBoard';
import './game.css'


function Game (){

    const [loggedInUser, setLoggedInUser] = useState(null)
    const [characters, setCharacters] = useState([])
    const [loot, setLoot] = useState([])
    const [gameData , setGameData] = useState([])
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

    const startGame = (event) => {
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
        body: JSON.stringify({game_id:gameData.game.id, character_id:gameData.character.id, encounter_id:gameData.encounter.id}),
      })
      .then((response) =>{
        if (response.ok){
          response.json().then((data) => {
         setGameData(data)
          //setActiveCharacter(data.character)
          //setEncounter(data.encounter)
          
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
         
            <div id='questChoice'>
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
                <button onClick={startGame}>Start Game</button>
                </form>
            </div>
        )
      }
        else {
          if (gameData.character.health > 0 && gameData.game.round < 12){
            return(
              <div>
              <h1 id='adventureHeader'>{gameData.character.name}'s adventure</h1>
              <div id='adventureBoard'>
              <h2 id='charaStats'>Your Stats: <br/>health: {gameData.character.health}<br/> Defence: {gameData.character.defence}<br/> Power: {gameData.character.power}</h2>
              <p>{gameData.encounter.plot} {gameData.encounter.selected_enemy.name} </p>
              <p id='enemyStats'>Enemy Stats: <br/> health: {gameData.encounter.selected_enemy.health}<br/> Defence: {gameData.encounter.selected_enemy.defence}<br/> Power: {gameData.encounter.selected_enemy.power} </p>
          
              </div>
                  <button id='fight' type='button' onClick={turnAdvance}>Continue</button>
              </div>
            )
          }
          else if (gameData.character.health > 0 && gameData.game.round == 12){
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
          <div id='noUserFound'>
            <h1 >Please Login To Play Legend Of Rogue</h1>
            <h2>In Order To Track Your Progress, The Game Needs An Account To Link The Characters To.<br/> Making An Account Is Free! Head Over To Create Account And Get Started</h2>
          </div>
        )
    }
    

    return(
        <div class='game'>
            {loggedInUser ? ifLoggedIn(): ifNoUserFound()}
        </div>
    )

}

export default Game