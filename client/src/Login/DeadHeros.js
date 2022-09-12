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
            <div className='listOfCharas' key={each.id}>
            <h1 className='charaName'>{each.name}</h1>
            <p className='charaBackstory'>Backstory: {each.backstory}</p>
            <p className='stat'>Health: {each.health}</p>
            <p className='stat'>Power: {each.power}</p>
            <p className='stat'>Defence: {each.defence}</p>
            <p className='stat'>Killing Blow {each.last_round.plot}</p>
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