from quart import Quart, request, jsonify

app = Quart(__name__)


@app.route('/')
async def hello():
    forwarded_for_header = request.headers.get("X-Forwarded-For", "")
    source_ip = forwarded_for_header.split(",")[0]
    return jsonify({"ip": source_ip})


if __name__ == '__main__':
    app.run()
