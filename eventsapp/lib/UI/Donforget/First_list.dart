import 'package:flutter/material.dart';
import 'package:eventsapp/bloc/blocs/user_bloc_provider.dart';
import 'package:eventsapp/models/classes/task.dart';
import 'package:eventsapp/models/widgets/EventsList_widget.dart';

class FirstList extends StatefulWidget {
  final String apiKey;
  FirstList({this.apiKey});
  @override
  _FirstListState createState() => _FirstListState();
}

class _FirstListState extends State<FirstList> {
  List<Task> taskList = [];
  TaskBloc tasksBloc;

  Future<Null> _handleRefresh() {
    tasksBloc = TaskBloc(widget.apiKey);
  }

  @override
  void initState() {
    tasksBloc = TaskBloc(widget.apiKey);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: tasksBloc.getTasks,
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot != null) {
              if (snapshot.data.length > 0) {
                return _buildListSimple(context, snapshot.data);
              } else if (snapshot.data.length == 0) {
                return Center(child: Text('No Data'));
              }
            } else if (snapshot.hasError) {
              return Container(
                child: Text("Error talk with the support"),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
      key: Key(item.taskId.toString()),
      title: EventsList(
        title: item.title,
      ),
    );
  }

  Widget _buildListSimple(BuildContext context, List<Task> taskList) {
    return Scrollbar(
      child: RefreshIndicator(
        child: ListView.builder(
            padding: EdgeInsets.only(top: 300),
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.all(10.0),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              Icons.adjust,
                                              color: Colors.amber,
                                              size: 50,
                                            )),
                                      ),
                                      Text(taskList[index].title)
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ]),
                ),
              );
            }),
        onRefresh:  _handleRefresh,
      ),
    );
  }
}
