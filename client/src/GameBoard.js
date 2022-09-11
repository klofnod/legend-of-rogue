import React, {useState, useEffect} from 'react';


function GameBoard(){
    
    console.log()
    const [loggedInUser, setLoggedInUser] = useState(null)
    const [gameData , setGameData] = useState([])

    const [error, setError] = useState([])

    useEffect(() => {
        fetch("/userInSession").then((response) => {
          if (response.ok) {
            response.json().then((user) => {
            setLoggedInUser(user)    

            });
          }
        });
      }, []);

    console.log(gameData)
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

    if (gameData.character.health > 0 && gameData.game.round < 12){
        return(
          <div>
          <h1>{gameData.character.name} adventure</h1>
          <h2>Current Stats</h2>
          <h2>health: {gameData.character.health} Power: {gameData.character.power} Defence: {gameData.character.defence}</h2>
          <p>{gameData.encounter.plot} {gameData.encounter.selected_enemy.name} </p>
          <p>Enemy Stats: health: {gameData.encounter.selected_enemy.health} Power: {gameData.encounter.selected_enemy.power} Defence: {gameData.encounter.selected_enemy.defence} </p>
          <button type='button' onClick={turnAdvance}>Continue</button>
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
