import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _todos = ['task 1', 'task 2', 'task 3'];

  void _addTodo() {
    showDialog (
      context: context,
      builder: (BuildContext context) {
        String newTodo = '';

        return AlertDialog(
          title: Text('Enter New Task Below'),
          content: TextField(
            onChanged: (value) {
              newTodo = value;
            }
          ),
          actions: <Widget>[
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text('Cancel')),
            ElevatedButton(onPressed: () {
              setState(() {
                _todos.add(newTodo);
              });
              Navigator.of(context).pop();
            }, child: const Text('Submit'))
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To Do List')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          
          return ListTile(
            title: Text(todo, style: TextStyle(decoration: todo.startsWith('-') ? TextDecoration.lineThrough : TextDecoration.none)),
            onLongPress: () {
              setState(() {
                _todos.removeAt(index);
              });
            },
            onTap: () {
              setState(() {
                if (todo.startsWith('-')) {
                _todos[index] = todo.substring(2);
                } else {
                _todos[index] = '- $todo';
                }
              });
            
            } 
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: _addTodo, child: const Icon(Icons.edit)),
    );
  }

}