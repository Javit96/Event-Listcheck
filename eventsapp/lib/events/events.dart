import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Todo {
   Map data;
   List events;

  Future getEvents() async {
    http.Response response = await http.get('http://10.0.2.2:5000/events');
    // debugPrint(response.body);
    data = json.decode(response.body);
    events = data['Events'];

    return events;
   }

}

