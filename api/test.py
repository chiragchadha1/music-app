import unittest
import json
from server import app

class LoginTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_login(self):
        # Test login for a user
        payload = {
            'username': 'asd',
            'password': 'paSSword123@'
        }
        response = self.app.post('/login', json=payload)
        data = json.loads(response.data)

        self.assertEqual(response.status_code, 200)
        self.assertIn('user', data)
        self.assertIn('token', data)
        self.assertIn('expiresIn', data)

if __name__ == '__main__':
    unittest.main()
