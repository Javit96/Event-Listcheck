from flask import Flask, jsonify
import Calendar 
Server = Flask(__name__)



@Server.route('/events')
def main():
    events = Calendar.getevents()
    return jsonify({'Events': events})

@Server.route('/events/<string:event_name>')
def getevent(event_name):
    events = Calendar.getevents()
    EventsFound = [event for event in events if event['summary'] == event_name]
    if (len(EventsFound) > 0):
        return jsonify({'event': EventsFound[0]})
    return jsonify({'message': 'Event Not found'})


if __name__ == '__main__':
    Server.run(debug=True)