import React, {useState, useEffect} from 'react';
import { BrowserRouter, BrowserRouter as Router, Route, Routes, Link, useMatch } from 'react-router-dom'
import GameBoard from '../GameBoard';
import './game.css'
import earlyGame from '../ArtAssets/Clearing3.png'
import earlyTransition from '../ArtAssets/CastleRuins2.png'
import middleGame from '../ArtAssets/Ruins3.png'
import middleTransition from '../ArtAssets/CastleStaircase1.png'
import lateGame from '../ArtAssets/CastleHallway.png'
import bossTransition from '../ArtAssets/CastleTower.png'
import boss from '../ArtAssets/CastleThroneRoom1.png'

function Game (){

    const [loggedInUser, setLoggedInUser] = useState(null)
    const [characters, setCharacters] = useState([])
    const [loot, setLoot] = useState({})
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
          setLoot(data[1])
         setGameData(data[0])
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
    function flee(){
      fetch('/flee', {
        method: 'POST', 
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({game_id:gameData.game.id, character_id:gameData.character.id, encounter_id:gameData.encounter.id}),
      })
      .then((response) =>{
        if (response.ok){
          response.json().then((data) => {
          setLoot({})
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
    const LootInfo = (
      <p id='lootReadOut'>You Received <br/> A {loot.name} <br/>A {loot.power} point increase <br/> to {loot.effect}</p>
    )
        function StoryImage(){ 
          switch(gameData.encounter.setting){
            case 'early':
              return(
                <img src={earlyGame} className='storyImage'/>
              )
            case 'transitionMiddle':
              return(
                <img src={earlyTransition} className='storyImage'/>
              )
            case 'middle':
              return(
                <img src={middleGame} className='storyImage'/>
              )
            case 'transitionLate':
              return(
                <img src={middleTransition} className='storyImage'/>
              )
            case 'late':
              return(
                <img src={lateGame} className='storyImage'/>
              )
            case 'transitionBoss':
              return(
                <img src={bossTransition} className='storyImage'/>
              )
            case 'boss':
              return(
                <img src={boss} className='storyImage'/>
              )
           
        }
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
          if (gameData.character.health > 0 && gameData.game.round < 13){
            return(
              <div>
              <h1 id='adventureHeader'>{gameData.character.name}'s adventure</h1>
              <div id='adventureBoard'>
              <h2 id='charaStats'>Your Stats: <br/>health: {gameData.character.health}<br/> Defence: {gameData.character.defence}<br/> Power: {gameData.character.power} <br/>{Object.keys(loot).length > 0 ? LootInfo : null} </h2>
              <div id='gameBoard'>
              <p id='encounterText'>{gameData.encounter.plot} {gameData.encounter.selected_enemy.name}. You see {gameData.encounter.selected_enemy.description} </p>
               {StoryImage()}
              </div>
              <h2 id='enemyStats'>Enemy Stats: <br/> health: {gameData.encounter.selected_enemy.health}<br/> Defence: {gameData.encounter.selected_enemy.defence}<br/> Power: {gameData.encounter.selected_enemy.power} </h2>
              
              </div>
                <div id='bottomInfoAndActions'>
                  {(gameData.game.round < 12) ?<button id='fleeButton' className='actionButtons'  type='button' onClick={flee}>Flee</button>: null }
                  
                  <button id='fightButton' className='actionButtons' type='button' onClick={turnAdvance}>Fight</button>
                  </div>
              </div>
            )
          }
          else if (gameData.character.health > 0 && gameData.game.round === 13){
            return(
              <div>
                <h1 className='gameoverText'>You Are Victorious <br/> Congratulations your hero has seized the day and conquered this adventure. Try your luck at another or let your hero rest, the choice is yours </h1>
              </div>
            )
          }
          else{
            return(
              <div>
                <h1 className='gameoverText'>Your Hero Falls And Your Adventure Is Over. Head Back To Login To Create A New Character</h1>
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
        <div className='game'>
            {loggedInUser ? ifLoggedIn(): ifNoUserFound()}
        </div>
    )

}

export default Game