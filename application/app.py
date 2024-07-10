from flask import Flask, request, jsonify
from datetime import datetime
import logging
import json

app = Flask(__name__)

# Configuración de logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def log_request(request):
    log_data = {
        "method": request.method,
        "url": request.url,
        "headers": dict(request.headers),
        "args": request.args.to_dict(),
        "timestamp": datetime.utcnow().isoformat()
    }
    logger.info(json.dumps(log_data))

@app.route('/hello_world', methods=['GET'])
def hello_world():
    log_request(request)
    return jsonify({"message": "Hello World!"}), 200

@app.route('/current_time', methods=['GET'])
def current_time():
    log_request(request)
    name = request.args.get('name', 'World')
    timestamp = int(datetime.utcnow().timestamp())
    return jsonify({"message": f"Hello {name}", "timestamp": timestamp}), 200

@app.route('/healthcheck', methods=['GET'])
def healthcheck():
    log_request(request)
    return '', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
