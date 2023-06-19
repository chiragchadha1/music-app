import { useState } from 'react';
import { Form, Button } from 'react-bootstrap';
import { Link } from 'react-router-dom';

function Login() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');

    const loginUser = () => {
        console.log('logged in');
        console.log(username);
        console.log(password);

        setUsername('');
        setPassword('');
    }


    return (
        <div className='container'>
            <h1 className='my-3'>Login</h1>
            <div className="form">
                <form>

                    <Form.Group className='mb-3'>
                        <Form.Label>Username</Form.Label>
                        <Form.Control required type="text" placeholder='Username' value={username} name="username"onChange={(e) => {setUsername(e.target.value)} }/>
                    </Form.Group>

                    <Form.Group className='mb-3'>
                        <Form.Label>Password</Form.Label>
                        <Form.Control required type="password" placeholder='Password' value={password} name="password" onChange={(e) => {setPassword(e.target.value)} }/>
                    </Form.Group>

                    <Form.Group className='mb-3'>
                        <Button as='sub' variant='primary' onClick={loginUser}>Sign Up</Button>
                    </Form.Group>

                    <Form.Group>
                        <small>Don&apos;t have an account? <Link to="/signup">Create one!</Link></small>
                    </Form.Group>
                </form>
            </div>
        </div>
    );
}

export default Login;