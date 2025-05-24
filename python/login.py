from flask import Flask, request, session, jsonify

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'  # Needed for session management

# Hardcoded user credentials for demo
VALID_USERNAME = 'admin'
VALID_PASSWORD = 'password123'

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()

    username = data.get('username')
    password = data.get('password')

    if username == VALID_USERNAME and password == VALID_PASSWORD:
        session['user'] = username
        return jsonify({'message': 'Login successful'}), 200
    else:
        return jsonify({'message': 'Invalid credentials'}), 401

@app.route('/logout', methods=['POST'])
def logout():
    if 'user' in session:
        session.pop('user')
        return jsonify({'message': 'Logout successful'}), 200
    else:
        return jsonify({'message': 'No user logged in'}), 400

@app.route('/status', methods=['GET'])
def status():
    if 'user' in session:
        return jsonify({'logged_in': True, 'user': session['user']}), 200
    else:
        return jsonify({'logged_in': False}), 200

if __name__ == '__main__':
    app.run(debug=True)