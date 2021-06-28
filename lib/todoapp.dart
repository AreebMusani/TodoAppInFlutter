import 'dart:js';

import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var input;
  List<dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Center(child: Text("TODO APP")),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepOrangeAccent
            ),
            child: ListTile(
              title: Text("${list[index]}"),
              leading: Text("${index + 1}", style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Container(
                width: 80,
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.edit), onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Edit Item"),
                          content: TextField(
                            controller: TextEditingController()..text = "${list[index]}",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Item Name',
                            ),
                            onChanged: (value){
                              input = value;
                            },
                          ),
                          actions: [
                            ElevatedButton(
                            onPressed: (){
                              setState(() {
                                list.replaceRange(index, index + 1, {input});
                              });
                              Navigator.of(context).pop();
                            }, 
                            child: Text("Edit Item")
                            )
                          ],
                        );
                      });
                    }),
                    IconButton(icon: Icon(Icons.delete), onPressed: (){setState(() {
                      list.removeAt(index);
                    });}),
                  ],
                ),
              ),
            ),
          );
        } 
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 30),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.deepOrangeAccent,
                child: Text("CLEAR"),
                onPressed: (){
                  setState(() {
                    list.clear();
                  });
                } 
              ),
              FloatingActionButton(
                backgroundColor: Colors.deepOrangeAccent,
                child: Text("ADD"),
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        title: Text("Add Item"),
                        content: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Item Name',
                          ),
                          onChanged: (value){
                            input = value;
                          },
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: (){
                              setState(() {
                                list.add(input);
                              });
                              Navigator.of(context).pop();
                            }, 
                            child: Text("Add Item")
                          )
                        ],
                      );
                    }
                  );
                } 
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
