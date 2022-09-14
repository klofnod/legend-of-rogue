import React, {useState, useEffect} from 'react';
import './Create.css'

function Create (){
    const [userName, setUserName] = useState("")
    const [password, setPassword] = useState("")
    const [confirmPassword, setConfirmPassword] = useState("")

    const [error, setError] = useState([])
    console.log(error)

    function HandleCreate(e){
        e.preventDefault()
        fetch('/combatants', {
          method: 'POST', 
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({username:userName, password:password, password_confirmation:confirmPassword}),
        })
          .then((response) =>{
            if (response.ok){
              response.json().then((data) => {
              console.log('Success:', data);
          })
            }
            else{
              response.json().then((data) => {
                setError(data.errors)
            })
            }
          }
        )
      }
      const listOfErrors =
      error.map((each)=>{
        return(
          <p>{each}</p>
        )
 
      })
    return(
      <div id='createAccount'>
        <h1>Create An Account And Begin Your Adventures.</h1>
        <form onSubmit={HandleCreate}>
            <label>
                Account Name
                <input class='createInput'
                    type="text"
                    value={userName}
                    onChange={(e) => setUserName(e.target.value)}
                />
            </label>
            <label>
                Password
                <input class='createInput'
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />
            </label>
            <label>
                Confirm Password
                <input class='createInput'
                    type="password"
                    value={confirmPassword}
                    onChange={(e) => setConfirmPassword(e.target.value)}
                />
            </label>
            <button id='createAccountButton' type="submit">Create Account</button>
        </form>
        {listOfErrors}
      </div>
    )
}
export default Create