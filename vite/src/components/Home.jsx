import { useState, useEffect } from 'react';

function Home() {
    const [data, setData] = useState([{}]);

    useEffect(() => {
        fetch('http://127.0.0.1:5000/members')
            .then((res) => res.json())
            .then((data) => {
                setData(data);
                console.log(data);
            });
    }, []);

    return (
        <div className="home">
            <h1>Home</h1>
            {typeof data.members === 'undefined' ? <p>Loading</p> : data.members.map((member, i) => <p key={i}>{member}</p>)}
        </div>
    );
}

export default Home;
