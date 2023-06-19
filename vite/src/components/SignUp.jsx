import { Form, Button, Alert } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import { useForm } from 'react-hook-form';
import { useState } from 'react';

function SignUp() {
    const {
        register,
        watch,
        handleSubmit,
        reset,
        formState: { errors },
    } = useForm({ mode: 'onChange' });
    const password = watch('password');
    const [show, setShow] = useState(false);
    const [serverResponse, setServerResponse] = useState('');
    const [successful, setSuccessful] = useState(undefined);

    const onSubmit = (data) => {
        console.log(data);

        if (data.password === data.confirmPassword) {
            const body = {
                firstName: data.firstName,
                lastName: data.lastName,
                username: data.username,
                dob: data.dob,
                email: data.email,
                password: data.password,
            };
            const requestOptions = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(body),
            };

            fetch('http://127.0.0.1:5000/signup', requestOptions)
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
                    reset();
                })
                .catch((err) => {
                    console.log(err);
                    setServerResponse(err.message);
                    setShow(true);
                    setSuccessful(false);
                });
        }
    };

    return (
        <div className="container">
            <h1 className="my-3">Sign Up</h1>
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
                    <Form.Group className="mb-3">
                        <Form.Label>First Name</Form.Label>
                        <Form.Control
                            required
                            type="text"
                            placeholder="First Name"
                            {...register('firstName', {
                                required: 'First name is required',
                                maxLength: {
                                    value: 50,
                                    message: 'First name must be less than 50 characters',
                                },
                            })}
                        />

                        {errors.firstName && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.firstName.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className="mb-3">
                        <Form.Label>Last Name</Form.Label>
                        <Form.Control
                            required
                            type="text"
                            placeholder="Last Name"
                            {...register('lastName', {
                                required: 'Last name is required',
                                maxLength: {
                                    value: 50,
                                    message: 'Last name must be less than 50 characters',
                                },
                            })}
                        />

                        {errors.lastName && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.lastName.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className="mb-3">
                        <Form.Label>Username</Form.Label>
                        <Form.Control
                            required
                            type="text"
                            placeholder="Username"
                            {...register('username', {
                                required: 'Username is required',
                                maxLength: {
                                    value: 50,
                                    message: 'Username must be less than 50 characters',
                                },
                            })}
                        />

                        {errors.username && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.username.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className="mb-3">
                        <Form.Label>Date of Birth</Form.Label>
                        <Form.Control
                            required
                            type="date"
                            placeholder="Date of Birth"
                            {...register('dob', {
                                required: 'Date of Birth is required',
                                pattern: {
                                    value: /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/,
                                    message: 'Date of Birth is invalid',
                                },
                            })}
                        />

                        {errors.dob && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.dob.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className="mb-3">
                        <Form.Label>Email</Form.Label>
                        <Form.Control
                            required
                            type="email"
                            placeholder="Email Address"
                            {...register('email', {
                                required: 'Email address is too long',
                                maxLength: {
                                    value: 255,
                                    message: 'Email address must be less than 255 characters',
                                },
                                pattern: {
                                    value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i,
                                    message: 'Email address is incorrect',
                                },
                            })}
                        />

                        {errors.email && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.email.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className="mb-3">
                        <Form.Label>Password</Form.Label>
                        <Form.Control
                            required
                            type="password"
                            placeholder="Password"
                            {...register('password', {
                                required: 'Password is required',
                                minLength: {
                                    value: 8,
                                    message: 'Password must have at least 8 characters',
                                },
                                pattern: {
                                    value: /^(\S)(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[~`!@#$%^&*()--+={}\[\]|\\:;"'<>,.?/_₹])[a-zA-Z0-9~`!@#$%^&*()--+={}\[\]|\\:;"'<>,.?/_₹]{10,16}$/, //eslint-disable-line
                                    message:
                                        'Password should include at least one uppercase, one lowercase, one numeric value and one special character',
                                },
                                maxLength: {
                                    value: 255,
                                    message: 'Password must be less than 255 characters',
                                },
                            })}
                        />

                        {errors.password && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.password.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className="mb-3">
                        <Form.Label>Confirm Password</Form.Label>
                        <Form.Control
                            required
                            type="password"
                            placeholder="Confirm Password"
                            {...register('confirmPassword', { validate: (value) => value === password || 'Passwords must match' })}
                        />

                        {errors.confirmPassword && (
                            <div className="my-3 alert alert-danger" role="alert">
                                {errors.confirmPassword.message}
                            </div>
                        )}
                    </Form.Group>

                    <Form.Group className="mb-3">
                        <Button as="sub" variant="primary" onClick={handleSubmit(onSubmit)}>
                            Sign Up
                        </Button>
                    </Form.Group>

                    <Form.Group>
                        <small>
                            Already have an account? <Link to="/login">Login!</Link>
                        </small>
                    </Form.Group>
                </form>
            </div>
        </div>
    );
}

export default SignUp;
