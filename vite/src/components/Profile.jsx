import { useIsAuthenticated, useAuthUser } from 'react-auth-kit';

function Profile() {
    const isAuthenticated = useIsAuthenticated();
    const user = useAuthUser();

    if (!isAuthenticated()) {
        return <p>User not logged in.</p>;
    }

    return (
        <div>
            <h2>Welcome {user().first_name}</h2>
            <br />
            <p><strong>Username:</strong> {user().username}</p>
            <p><strong>Email:</strong> {user().email_id}</p>
            <p><strong>First Name:</strong> {user().first_name}</p>
            <p><strong>Last Name:</strong> {user().last_name}</p>
            <p><strong>Date of Birth:</strong> {user().date_of_birth}</p>
        </div>
    );
}

export default Profile;