import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
final controller = TextEditingController(text: 'Teste');
List<String> todos = [];
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Todos')
    ),
    body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          TextField(
            controller: controller,
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(todos[index]),
                  onTap: (){
                    setState((){
                      todos.remove(todos[index]);
                    });
                  },
                );
              }
            ),
          )
        ]
      )

    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: (){
        if(controller.text.isNotEmpty){
          setState((){
            todos.add(controller.text);
            controller.clear();
          });
        }
      }
    )
  );
 }
}
