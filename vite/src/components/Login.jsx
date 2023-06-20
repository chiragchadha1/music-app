import { useState } from 'react';
import { Form, Button, Alert } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { useForm } from 'react-hook-form';
import { useSignIn } from 'react-auth-kit';
import { config } from '/Constants';

function Login() {
    const URL = config.url;
    const { register, handleSubmit, formState: { errors } } = useForm();
    const [show, setShow] = useState(false);
    const [serverResponse, setServerResponse] = useState('');
    const [successful, setSuccessful] = useState(undefined);
    const signIn = useSignIn();

    const onSubmit = (data) => {
        const body = {
            username: data.username,
            password: data.password,
        };
        const requestOptions = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(body),
        };

        fetch(`${URL}/api/login`, requestOptions)
            .then((response) => {
                if (!response.ok) {
                    return response.json().then((json) => {
                        throw new Error(json.response);
                    });
                }
                return response.json();
            })
            .then((data) => {
                console.log(data.response);
                setServerResponse(data.response);
                setShow(true);
                setSuccessful(true);

                // Save the token and user data in the local storage
                signIn({
                    token: data.token,
                    expiresIn: 36000000,
                    tokenType: 'Bearer',
                    authState: data.user
                });
            })
            .catch((err) => {
                console.log(err);
                setServerResponse(err.message);
                setShow(true);
                setSuccessful(false);
            });
    };


    return (
        <div className='container'>
            <h1 className='my-3'>Login</h1>
            <div className="form">
                {show ? (
                    successful ? (
                        <Alert variant="success" onClose={() => setShow(false)} dismissible>
                            <Alert.Heading>Success!</Alert.Heading>
                            <p>{serverResponse}</p>
                        </Alert>
                    ) : (
                        <Alert variant="danger" onClose={() => setShow(false)} dismissible>
                            <Alert.Heading>Error!</Alert.Heading>
                            <p>{serverResponse}</p>
                        </Alert>
                    )
                ) : (
                    <p></p>
                )}
                <form onSubmit={handleSubmit(onSubmit)}>
                    <Form.Group className='mb-3'>
                        <Form.Label>Username</Form.Label>
                        <Form.Control required type="text" placeholder='Username' {...register('username', { required: 'Username is required' })} />
                        {errors.username && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.username.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className='mb-3'>
                        <Form.Label>Password</Form.Label>
                        <Form.Control required type="password" placeholder='Password' autoComplete="on" {...register('password', { required: 'Password is required' })} />
                        {errors.password && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.password.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className='mb-3'>
                        <Button as='sub' variant='primary' onClick={handleSubmit(onSubmit)}>Log In</Button>
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