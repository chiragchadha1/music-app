import NavBar from './components/NavBar';
import { Routes, Route } from 'react-router-dom';
import Home from './components/Home';
import SignUp from './components/SignUp';
import Login from './components/Login';

function App() {
    return (
        <div className='container'>
            <NavBar />
            <Routes>
                <Route path="/" element={<Home />} />
                <Route path="signup" element={<SignUp />} />
                <Route path="login" element={<Login />} />
            </Routes>
        </div>
    );
}

export default App;