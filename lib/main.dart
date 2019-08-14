import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/firestoreservice.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'taskscreen.dart';

import 'task.dart';

import 'appBar.dart';





void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter ToDo APP',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primaryColor: Color(0xff543B7A),
      
      ),
      
      home: MyHomePage(),
    
    );
  
  }

}





class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}




class _MyHomePageState extends State<MyHomePage> {


  List<Task> items;

  FirestoreService fireServ = new FirestoreService();

  StreamSubscription<QuerySnapshot> todoTasks;


  @override
  void initState(){

    super.initState();


    //Here we'll asign the item to new list, here retrieving the data from Firestore
    items = new List();


    //---if todoTask condition
    todoTasks?.cancel();
    

    todoTasks = fireServ.getTaskList().listen((QuerySnapshot snapshot){


      final List<Task> tasks = snapshot.documents

      .map((documentSnapshot) => Task. fromMap(documentSnapshot.data)).toList();


      setState((){

        this.items = tasks;

      });

    });
  
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,

      body: Column(

        children: <Widget>[


          MyAppBar(),


          Container(

            width: MediaQuery.of(context).size.width,

            height: MediaQuery.of(context).size.height - 80,


            child: ListView.builder(


              itemCount: items.length,


              itemBuilder: (context, index){

                return Stack(

                  children:<Widget>[


                    Column(
                

                      children: <Widget>[

                        Padding(

                          padding: EdgeInsets.only(left: 8.0, right: 8.0),

                          child: Container(

                            width: MediaQuery.of(context).size.width,

                            height: 80.0,

                            child: Padding(

                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),

                              child: Material(

                                color: Colors.white,

                                elevation: 14.0,

                                shadowColor: Color(0x802196f3),

                                child: Center(

                                  child: Padding(

                                    padding: EdgeInsets.all(8.0),

                                    child: Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: <Widget>[

                                        todoType('${items[index].tasktype}'),

                                        Text(

                                          '${items[index].taskname}',

                                          style: TextStyle(

                                            color: Colors.black,

                                            fontSize: 20.0,

                                          ),

                                        ),


                                        Column(

                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: <Widget>[

                                            Text(

                                              '${items[index].taskdate}',
                                              
                                              style: TextStyle(
                                              
                                                color: Colors.black,
                                              
                                                fontSize: 18.0,
                                              
                                                fontWeight: FontWeight.bold
                                                
                                              ),

                                            ),


                                            Text(
                                              
                                              '${items[index].tasktime}',
                                            
                                              style: TextStyle(
                                              
                                                color: Colors.black,
                                              
                                                fontSize: 16.0
                                                
                                              ),

                                            ),



                                          ],

                                        ),

                                      ],

                                    ),


                                  ),

                                ),

                              ),

                            ),

                          ),

                        ),
                       
                      ],

                    ),

                  ]

                );

              }

            ),

          ),
        
        ]

      ),




      floatingActionButton: FloatingActionButton(

        backgroundColor: Color(0xFFFA7397),

        child: Icon(

          FontAwesomeIcons.listUl,

          color: Color(0xFFFDDE42),

        ),

        onPressed: () {

          //Navigator.push(context,MaterialPageRoute(builder: (context) => TaskScreen()),

          Navigator.push(

            context,
            
            MaterialPageRoute(

              builder: (context) => TaskScreen(Task('', '', '', '', '')),
              
              fullscreenDialog: true
                
            ),

          );

        },

      ),

    );

  }

}



  Widget todoType(String icontype) {

    IconData iconval;

    Color colorval;


    switch (icontype) {

      case 'travel':

        iconval = FontAwesomeIcons.mapMarkerAlt;

        colorval = Color(0xff4158ba);

        break;


      case 'shopping':

        iconval = FontAwesomeIcons.shoppingCart;

        colorval = Color(0xfffb537f);

        break;


      case 'gym':

        iconval = FontAwesomeIcons.dumbbell;

        colorval = Color(0xff4caf50);

        break;


      case 'party':

        iconval = FontAwesomeIcons.glassCheers;

        colorval = Color(0xff9962d0);

        break;


      default:

         iconval = FontAwesomeIcons.tasks;

         colorval = Color(0xff0dc8f5);

      //
    }


    return CircleAvatar(

      backgroundColor: colorval,

      child: Icon(
        
        iconval, 
        
        color: Colors.white, 
        
        size: 20.0
        
      ),


    );
  }



