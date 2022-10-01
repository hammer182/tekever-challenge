from flask import *
import json, time

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home_page():
    data_set ={'Page': 'Home', 'Message': 'Home page successfully loaded', 'Timestamp':time.time()}
    json_dump = json.dumps(data_set)

    return json_dump

@app.route('/user/', methods=['GET'])
def request_page():
    user_query = str(request.args.get('user')) # /user/?user=TEST
    
    if user_query.lower() == 'tekever':
        data_set ={'Page': 'Request', 'Message': "Hi Tekever, I really enjoied doing this challenge. What's the next step?", 'Timestamp':time.time()}
    else:
        data_set ={'Page': 'Request', 'Message': f'Successfully got the request for {user_query}', 'Timestamp':time.time()}
    
    json_dump = json.dumps(data_set)

    return json_dump

if __name__ == '__main__':
    app.run(port=5000)