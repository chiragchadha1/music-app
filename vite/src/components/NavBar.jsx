import { Nav, Navbar, Container, Button } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';
import { useIsAuthenticated, useSignOut } from 'react-auth-kit';

function NavBar() {
    const isAuthenticated = useIsAuthenticated();
    // const authUser = useAuthUser();
    const signOut = useSignOut();

    const handleSignOut = () => {
        signOut();
    };

    return (
        <Navbar expand="lg" className="bg-body-tertiary">
            <Container>
                <Navbar.Brand href="/">Music App</Navbar.Brand>
                <Navbar.Toggle aria-controls="navbar-toggle" />
                <Navbar.Collapse id="navbar-toggle">
                    <Nav className="me-auto">
                        <LinkContainer to="/">
                            <Nav.Link>Home</Nav.Link>
                        </LinkContainer>
                    </Nav>
                    {!isAuthenticated() && (
                        <LinkContainer className="me-3" to="/signup">
                            <Nav.Link>Sign Up</Nav.Link>
                        </LinkContainer>
                    )}
                    {!isAuthenticated() ? (
                        <LinkContainer to="/login">
                            <Nav.Link>Login</Nav.Link>
                        </LinkContainer>
                    ) : (
                        <div className="ml-auto navbar-nav">
                            {/* <Navbar.Text className='pe-3'>Hello, {authUser().username}</Navbar.Text> */}
                            <LinkContainer to="/profile" className='pe-3'>
                                <Nav.Link>Profile</Nav.Link>
                            </LinkContainer>
                            <Button variant="outline-danger" onClick={handleSignOut}>
                                Sign Out
                            </Button>
                        </div>
                    )}
                </Navbar.Collapse>
            </Container>
        </Navbar>
    );
}

export default NavBar;
