from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/')
def hello():
    forwarded_for_header = request.headers.get("X-Forwarded-For", "")
    source_ip = forwarded_for_header.split(",")[0]
    return jsonify({"ip": source_ip})


if __name__ == '__main__':
    app.run()
