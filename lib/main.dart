import 'package:flutter/material.dart';

void main() => runApp(CounterApplication());

class CounterApplication extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter counter application',
      home: CounterScreenState(),
    );
  }
}


class CounterScreenState extends StatefulWidget {
  @override
  CounterScreen createState() => CounterScreen();
}


class CounterScreen extends State<CounterScreenState> {

  int _count = 0;

  void _incrementCount() {
    setState((){
      _count++;
    });
  }

  void _decrementCount() {
    if(_count < 1) {
      return;
    }

    setState((){
      _count--;
    });
  }

  void _resetCount() {
    setState((){
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        backgroundColor: Color.fromARGB(255, 224, 218, 218),
        elevation: 20,
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('CANCEL'),
                      ),
                      TextButton(
                      onPressed: _resetCount,
                      child: const Text('RESET'),
                      ),
                  ],
                  contentPadding: const EdgeInsets.all(20.0),
                  content: const Text('Do you really want reset this counter?')
                ),
              );
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('CANCEL'),
                      ),
                      TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('APPLY'),
                      ),
                  ],
                  title: const Text('Edit this counter'),
                  contentPadding: const EdgeInsets.all(20.0),
                  content: const Text('Title:')
                  
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
          PopupMenuButton( 
            onSelected: (result) {
              if (result == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              }
            },
            //halaman settings
            icon: Icon(Icons.more_vert),
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Delete counter"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Settings"),
                ),
              ];
            },
          ),
        ],
      ),
      //appbar

      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Counter'),
            ),
            ListTile(
              title: const Text('+ Add counter'),
              textColor: Colors.white,
              onTap: (){
              showDialog(
                context: context,
                  builder: (context) => AlertDialog(
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text('ADD'),
                      ),
                    ],
                    title: const Text('Add a new counter'),
                    contentPadding: const EdgeInsets.all(20.0),
                    content: const Text('Title:') 
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //drawer 
         
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:
                Text(
                  '${_count}',
                  style: TextStyle(fontSize: 250),   
                ),
            ),
            Column(
              children: [
                Expanded(
                  child: 
                    FloatingActionButton(
                      child: Icon(Icons.add),
                      backgroundColor: Colors.blue,
                      onPressed: _incrementCount,
                    ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: FloatingActionButton(
                    child: Icon(Icons.remove),
                    backgroundColor: Colors.blue,
                    onPressed: _decrementCount,
                  ),
                ),
                SizedBox(height: 10),  
              ],
            ),
          ],
        ),
      );
    
  }
}

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
    );
  }
}
//settings