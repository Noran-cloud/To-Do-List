import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  List<Map<String,String>> notes = [];
  TextEditingController note = TextEditingController();

  String getCurrentTime(){
    return DateFormat('hh:mm a').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4368FF),
      appBar: AppBar(title: Text('Todo List',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Color(0xff4368FF),),
      body: ListView.builder(
         itemCount: notes.length,
         itemBuilder: (context, index) {
           return ListTile(
                title: Text('${notes[index]['text']}',style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold)),
                subtitle: Text('${notes[index]['time']}',style: TextStyle(fontSize: 19,color: Colors.white)),
                trailing: IconButton(onPressed: () { 
                  showDialog(context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: Text('Delete',style: TextStyle(color: Colors.black,fontSize: 20),),
                      content: Text('Are you sure you want to delete this item?'),
                      actions: [
                        MaterialButton(onPressed: (){
                            setState(() {
                          notes.removeAt(index);
                        });
                          Navigator.of(context).pop();
                        },child: Text('Yes',style: TextStyle(color: Colors.blue,fontSize: 15))),
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop();
                        },child: Text('Cancel',style: TextStyle(color: Colors.blue,fontSize: 15)),),
                      ],
                    );
                  });
                  

             }, icon: Icon(Icons.delete,color: Colors.white,size: 30),),

           );
         },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          note.clear();
          showDialog(
            barrierDismissible: false,
            context: context, 
            builder: (context){
              return AlertDialog(
                  title: Text('Add note'),
                  content: TextFormField(
                    autofocus: true,
                    maxLength: 100,
                    controller: note,
                    decoration: InputDecoration(hintText: 'Enter your note',hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  actions: [
                    MaterialButton(onPressed: (){
                      if(note.text.trim().isNotEmpty){
                        setState(() {
                           notes.add({
                            'text': note.text.trim(),
                            'time': getCurrentTime()
                           });
                        });
                        Navigator.of(context).pop();
                      }
                    },child: Text('Save',style: TextStyle(color: Colors.blue,fontSize: 15),),),
                    MaterialButton(onPressed: (){
                      Navigator.of(context).pop();
                    },child: Text('Cancel',style: TextStyle(color: Colors.blue,fontSize: 15),),),
                  ],
              );
          }
          );
        },
        child: Icon(Icons.add,color: Colors.blue,),
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        ),
    );
  }
}