import { useEffect, useState, useMemo } from 'react';
import { useIsAuthenticated, useAuthUser, useSignOut } from 'react-auth-kit';
import { useForm } from 'react-hook-form';
import { config } from '/Constants';
import { Form, Button, Alert } from 'react-bootstrap';

function Profile() {
    const URL = config.url;
    const {
        register,
        handleSubmit,
        formState: { errors },
        reset,
    } = useForm();
    const isAuthenticated = useIsAuthenticated();
    const user = useAuthUser();
    const userData = useMemo(() => user(), [user]); // Memoize user data to prevent unnecessary rerenders
    const [editMode, setEditMode] = useState(false);
    const [show, setShow] = useState(false);
    const [serverResponse, setServerResponse] = useState('');
    const [successful, setSuccessful] = useState(undefined);
    const [formattedDOB, setFormattedDOB] = useState('');

    const signOut = useSignOut();

    useEffect(() => {
        if(userData){
            const dob = new Date(userData.date_of_birth);
            const formattedDOB = dob.toISOString().substring(0, 10);
            setFormattedDOB(formattedDOB);

            const preparedData = {
                firstName: userData.first_name || '',
                lastName: userData.last_name || '',
                username: userData.username || '',
                dob: formattedDOB || '',
                email: userData.email_id || '',
                password: userData.password || '',
            };

            console.log(preparedData);

            reset(preparedData); // reset form with userData
        }
    }, [userData, reset]);

    const onSubmit = (data) => {
        console.log(data);
        const body = {
            first_name: data.firstName,
            last_name: data.lastName,
            username: data.username,
            date_of_birth: data.dob,
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

        fetch(`${URL}/api/update_user_details`, requestOptions)
            .then((response) => {
                if (!response.ok) {
                    return response.json().then((json) => {
                        console.error('Error in request:', json.message);
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
            })
            .catch((err) => {
                console.log(err);
                setServerResponse(err.message);
                setShow(true);
                setSuccessful(false);
            });
    };

    const onDeleteUser = () => {
        // Prepare the request options for the delete request
        const requestOptions = {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            },
            // Include the user's ID or other unique identifier in the request body
            body: JSON.stringify({ username: userData.username }),
        };

        fetch(`${URL}/api/delete_user`, requestOptions)
            .then((response) => {
                if (!response.ok) {
                    return response.json().then((json) => {
                        console.error('Error in request:', json.message);
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
                // Clear the user's authentication token and redirect them
                signOut();  // You need to get signOut function from useSignOut() hook.
            })
            .catch((err) => {
                console.log(err);
                setServerResponse(err.message);
                setShow(true);
                setSuccessful(false);
            });
    };

    if (!isAuthenticated()) {
        return <p>User not logged in.</p>;
    }

    return (
        <div>
            <h2>Welcome {user().first_name}</h2>
            <br />
            {show ? (
                    successful ? (
                        <Alert variant="success" onClose={() => setShow(false)} dismissible>
                            <Alert.Heading>Success!</Alert.Heading>
                            <p>{serverResponse}. Please sign out and login to see changes.</p>
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
            {editMode ? (
                <form onSubmit={handleSubmit(onSubmit)}>
                    <Form.Group className="mb-3">
                        <Form.Label>First Name</Form.Label>
                        <Form.Control
                            required
                            type="text"
                            placeholder="First Name"
                            defaultValue={userData?.firstName}
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
                            defaultValue={userData?.lastName}
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
                            type="text"
                            defaultValue={userData?.username}
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
                            defaultValue={userData?.dob}
                            {...register('dob', {
                                required: 'Date of Birth is required',
                                pattern: {
                                    value: /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[0-1])$/,
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
                            defaultValue={userData?.email}
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
                            type="password"
                            placeholder="Password"
                            autoComplete="on"
                            defaultValue={userData?.password}
                            {...register('password', {
                                minLength: {
                                    value: 8,
                                    message: 'Password must have at least 8 characters',
                                },
                                pattern: {
                                    value: /^^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/, //eslint-disable-line
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
                        <Button type="submit" variant="primary">
                            Submit
                        </Button>
                        <Button variant='danger' onClick={onDeleteUser}>Delete Account</Button>
                    </Form.Group>
                </form>
            ) : (
                <>
                    <p>
                        <strong>Username:</strong> {user().username}
                    </p>
                    <p>
                        <strong>Email:</strong> {user().email_id}
                    </p>
                    <p>
                        <strong>First Name:</strong> {user().first_name}
                    </p>
                    <p>
                        <strong>Last Name:</strong> {user().last_name}
                    </p>
                    <p>
                        <strong>Date of Birth:</strong> {formattedDOB}
                    </p>
                    <Button variant='primary' onClick={() => setEditMode(true)}>Edit</Button>
                </>
            )}
        </div>
    );
}

export default Profile;
