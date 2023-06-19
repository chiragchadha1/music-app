// import { Link } from 'react-router-dom'
// import { useState } from 'react';
import {Nav, Navbar, Container} from 'react-bootstrap'

function NavBar() {

    return (
        <Navbar expand="lg" className="bg-body-tertiary">
        <Container>
          <Navbar.Brand href="/">Music App</Navbar.Brand>
          <Navbar.Toggle aria-controls="navbar-toggle" />
          <Navbar.Collapse id="navbar-toggle">
            <Nav className="me-auto">
              <Nav.Link href="/">Home</Nav.Link>
              <Nav.Link href="/signup">Sign Up</Nav.Link>
              <Nav.Link href="/login">Login</Nav.Link>
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>
        // <nav className="navbar navbar-expand-lg bg-body-tertiary">
        //     <div className="container-fluid">
        //         <Link className="navbar-brand" to="/">Music App</Link>
        //         <button className="navbar-toggler" type="button" onClick={() => toggleMenu}>
        //         <span className="navbar-toggler-icon"></span>
        //         </button>
        //         <div className="collapse navbar-collapse" id="navbarNav">
        //         <ul className="navbar-nav">
        //             <li className="nav-item">
        //                 <Link className="nav-link active" to="/">Home</Link>
        //             </li>
        //             <li className="nav-item">
        //                 <Link className="nav-link active" to="/signup">Sign Up</Link>
        //             </li>
        //             <li className="nav-item">
        //                 <Link className="nav-link active" to="/login">Login</Link>
        //             </li>
        //         </ul>
        //         </div>
        //     </div>
        // </nav>
    );
}

export default NavBar;
