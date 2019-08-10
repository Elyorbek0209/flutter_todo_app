import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'task.dart';

import 'dart:async';

import 'newtask.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';


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
      
      home: CreateToDo(),
    
    );
  
  }

}



class CreateToDo extends StatefulWidget {

  @override
  _CreateToDoState createState() => _CreateToDoState();

}



class _CreateToDoState extends State<CreateToDo> {


  @override 
  void initState(){

    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //resizeToAvoidBottomInset: false,
    
      body: Column(

        children: <Widget>[

          _myAppBar(context),

          Center(

            child: Text("ToDo Task"),

          ),

        ],

      ),



      floatingActionButton: FloatingActionButton(

        backgroundColor: Color(0xfffa7397),

        child: Icon(
          
          FontAwesomeIcons.listUl,

          color: Color(0xfffdde42),

        ),

        onPressed: (){

          //Navigator.push(context, MaterialPageRoute(builder: (context) => TaskScreen()));

          Navigator.push(
            
            context, MaterialPageRoute(
              
              builder: (context) => NewTask(),

              fullscreenDialog: true
              
            )
              
              
          );


        },

      ),


    );

  }


  Widget _myAppBar(context){


    return Container(


      height: 80.0,

      width: MediaQuery.of(context).size.width,


      //---Decoration App Bar Begins---

      decoration: BoxDecoration(


        gradient: LinearGradient(


          colors: [

            const Color(0xFFFA7397),
            
            const Color(0xFFFDDE42),

          ],


          begin: FractionalOffset(0.0, 0.0),

          end: FractionalOffset(1.0, 0.0),

          stops: [0.0,1.0],

          tileMode: TileMode.clamp


        ),

      ),

      //---End of the Decoration App Bar---


      

      child: Padding(

        padding: EdgeInsets.only(top: 16.0),

        child: Center(

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[


              //---Arrow Icon App Bar Begins---

              Expanded(

                flex: 1,

                child: Container(

                  child: IconButton(

                    icon: Icon(

                      FontAwesomeIcons.arrowLeft,

                      color: Colors.white,

                    ),


                    onPressed: (){

                      //

                    },

                  ),


                ),

              ),

              //---End of the Arrow Icon App Bar---



              //---Theme of App Bar Begins---

              Expanded(

                flex: 5,

                child: Container(

                  child: Text(

                    'ToDo Tasks',

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 20.0
                        
                    ),

                  ),

                ),

              ),

              //---End of the Theme of App Bar---


              //---Search Icon of App Bar Begins---

              Expanded(

                flex: 1,

                child: Container(

                  child: IconButton(

                    icon: Icon(
                      
                      FontAwesomeIcons.search,

                      color: Colors.white,

                    ),

                    onPressed: (){

                      //

                    },

                  ),

                ),

              ),

              //---End of the Search Icon of App Bar---

            ],

          ),

        ),

      ),



    );

  }

}

