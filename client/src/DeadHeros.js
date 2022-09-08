import { BrowserRouter, BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'
import React, {useState, useEffect} from 'react';


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
            <div key={each.id}>
            <h1>{each.name}</h1>
            <p>{each.backstory}</p>
            <p>Health:{each.health}</p>
            <p>Power:{each.power}</p>
            <p>Defence:{each.defence}</p>
            <p>Killing Blow {each.last_round.plot}</p>
            </div>
        )
    })



    return(
        <div>
            <h1>These Are The Ones Who Did Not Make It</h1>
            {listOfFallen}
        </div>
    )


}

export default DeadHeros