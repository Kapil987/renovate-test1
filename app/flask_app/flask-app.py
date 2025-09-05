from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/healthz', methods=['GET'])
def healthz():
    # Simple health check response
    return jsonify({'status': 'ok'}), 200

if __name__ == '__main__':
    # Listen on all interfaces on port 8080
    app.run(host='0.0.0.0', port=8080)
