import 'package:flutter/material.dart';
import 'package:eventsapp/bloc/blocs/user_bloc_provider.dart';
import 'package:eventsapp/models/classes/task.dart';
import 'package:eventsapp/models/widgets/EventsList_widget.dart';
class FirstList extends StatefulWidget
{
  final String apiKey;
  FirstList({this.apiKey});
  @override
  _FirstListState createState() => _FirstListState();

}

class _FirstListState extends State<FirstList>
{
  List<Task> taskList = [];
  TaskBloc tasksBloc;

  @override
  void initState()
  {
    tasksBloc = TaskBloc(widget.apiKey);
  }

  @override
  void dispose()
  {
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    
    return Container
    (
      color: Colors.white,
      child: StreamBuilder
      (
        stream: tasksBloc.getTasks,
        initialData: [],
        builder: (context, snapshot){
          if (snapshot.hasData && snapshot != null)
          {
            if (snapshot.data.length > 0)
            {
              return _buildListSimple(context, snapshot.data);
            }
            else if (snapshot.data.length == 0)
            {
              
              return Center(child: Text('No Data'));
            }
          }
          else if (snapshot.hasError)
          {
            return Container(
              child: Text("Error talk with the support"),
              );
          }
          return CircularProgressIndicator();
        },
      )
    );
  }


  Widget _buildListTile(BuildContext context, Task item)
  {
    return ListTile
    (
      key: Key(item.taskId.toString()),
      title: EventsList(
        title: item.title,
      ),
    );
  }

  Widget _buildListSimple(BuildContext context, List<Task> taskList)
  {
  
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: ListView
        (
          padding: EdgeInsets.only(top: 300),
          children: taskList.map((Task item) => _buildListTile(context, item)).toList(),
     ),
    );
  }
  
}