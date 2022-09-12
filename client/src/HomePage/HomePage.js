import './HomePage.css'

function HomePage (){
    return(
        <div className='wholePage'>
        <h1 id='header'>Welcome Adventurers To <br/> LEGEND OF ROGUE</h1>
        <h1 id='warning'>Be Wary On These Adventures And Keep Your Wits About You</h1>
        <h2 id='mainBlurb'>This is a mini Rogue-like game I created for my capstone project while in Flatiron. I took inspiration from old text-based adventure games I played as a kid,
        and more recent games with expanded replayability built in with randomization. The main object of this project was to test my ability to not only randomize, but also build in logic to 
        help the player out in certian situation. Create An account and try your luck, see if you can complete all adventures with one character. </h2>
        </div>
    )
}

export default HomePage