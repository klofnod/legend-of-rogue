import { BrowserRouter, BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'
import React, {useState, useEffect} from 'react';
import './DeadHeros.css'


function DeadHeros (){

    const [characters, setCharacters] = useState([])

    useEffect(() => {
        fetch("/dead").then((response) => {
          if (response.ok) {
            response.json().then((data) => {
                setCharacters(data)
            });
          }
        });
      }, []);
      console.log(characters)
      const listOfFallen = characters.map((each)=>{
        return(
            <div class='listOfCharas' key={each.id}>
            <h1 class='charaName'>{each.name}</h1>
            <p class='charaBackstory'>Backstory: {each.backstory}</p>
            <p class='stat'>Health: {each.health}</p>
            <p class='stat'>Power: {each.power}</p>
            <p class='stat'>Defence: {each.defence}</p>
            <p class='stat'>Killing Blow {each.last_round.plot}</p>
            </div>
        )
    })



    return(
        <div>
            <h1 id='deadHeader'>Death Is Nothing To Us. Since When We Are, Death Has Not Come, And When Death Comes We Are Not</h1>
            {listOfFallen}
        </div>
    )


}

export default DeadHeros