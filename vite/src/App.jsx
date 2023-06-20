import NavBar from './components/NavBar';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { AuthProvider } from 'react-auth-kit';
import Home from './components/Home';
import SignUp from './components/SignUp';
import Login from './components/Login';
import Profile from './components/Profile';

function App() {
    return (
        <AuthProvider authStorageType="cookie">
            <Router>
                <div className="container">
                    <NavBar />
                    <Routes>
                        <Route path="/login" element={<Login />} />
                        <Route path="/signup" element={<SignUp />} />
                        <Route path="/profile" element={<Profile />} />
                        <Route path="/" element={<Home />} />
                    </Routes>
                </div>
            </Router>
        </AuthProvider>
    );
}

export default App;
