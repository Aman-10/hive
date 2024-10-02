from flask import Flask, jsonify
import psutil

app = Flask(__name__)

@app.route('/metrics')
def metrics():

    cpu_usage = psutil.cpu_percent(interval=1)
    memory_info = psutil.virtual_memory().percent

    return jsonify({
        "cpu": cpu_usage,
        "memory": memory_info
    })


if __name__ == '__main__':

    app.run(host='0.0.0.0', port=5000)
