
import 'package:flutter/material.dart';
import 'task.dart';
import 'firestoreservice.dart';
import 'appBar.dart';



class TaskScreen extends StatefulWidget {

  final Task task;

  TaskScreen(this.task);

  @override
  _TaskScreenState createState() => _TaskScreenState();

}




class _TaskScreenState extends State<TaskScreen> {

  FirestoreService fireServ = new FirestoreService();


  TextEditingController _taskNameController;

  TextEditingController _taskDetailsController;

  TextEditingController _taskDateController;

  TextEditingController _taskTimeController;


  int _myTaskType = 0;

  String taskVal;

  void _handleTaskType(int value) {

    setState(() {

      _myTaskType = value;

      switch (_myTaskType) {

        case 1:

          taskVal='travel';

          break;


        case 2:

          taskVal='shopping';

          break;


        case 3:

          taskVal='gym';

          break;


        case 4:

          taskVal='party';

          break;


        case 5:

          taskVal='others';

          break;


      }

    });

  }




  @override
  void initState() {

    super.initState();

    _taskNameController = new TextEditingController(text: widget.task.taskname);

    _taskDetailsController = new TextEditingController(text: widget.task.taskdetails);
    
    _taskDateController = new TextEditingController(text: widget.task.taskdate);
    
    _taskTimeController = new TextEditingController(text: widget.task.tasktime);
  }





  //-------------SCAFFOLD BEGINS ------------------

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


            child: ListView(


              children: <Widget>[


                Padding(

                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                    controller: _taskNameController,

                    decoration: InputDecoration(

                      labelText: "Task: "

                    ),

                  ),
                  
                  
                ),



                Padding(

                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                   controller: _taskDetailsController,

                    decoration: InputDecoration(

                      labelText: "Details: "

                    ),

                  ),
                  

                ),



                Padding(


                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                    controller: _taskDateController,

                    decoration: InputDecoration(

                      labelText: "Date: "

                    ),

                  ),
                  

                ),



                Padding(


                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                    controller: _taskTimeController,

                    decoration: InputDecoration(

                      labelText: "Time: "

                    ),

                  ),
                  

                ),


                SizedBox(height: 10.0),


                //----'Select Task Type:' Text Begins----

                Center(

                  child: Text(
                    
                    "Select Task Type:",

                    style: TextStyle(

                      fontSize: 20.0,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

                //----End of the 'Select Task Type:' Text----



                //------RADIO BUTTON COLUMN BEGINS-------
                
                Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[


                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[


                        Radio(

                          value: 1,

                          groupValue: _myTaskType,

                          onChanged: _handleTaskType,

                          activeColor: Color(0xFFFA7397),

                        ),


                        Text(
                          
                          "Travel",

                          style: TextStyle(

                            fontSize: 16.0,

                            fontWeight: FontWeight.bold,


                          ),

                        )


                      ],

                    ),




                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[


                        Radio(

                          value: 2,

                          groupValue: _myTaskType,

                          onChanged: _handleTaskType,

                          activeColor: Color(0xFFFA7397),

                        ),


                        Text(
                          
                          "Shopping",

                          style: TextStyle(

                            fontSize: 16.0,

                            fontWeight: FontWeight.bold,


                          ),

                        )


                      ],

                    ),





                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[


                        Radio(

                          value: 3,

                          groupValue: _myTaskType,

                          onChanged: _handleTaskType,

                          activeColor: Color(0xFFFA7397),

                        ),


                        Text(
                          
                          "GYM",

                          style: TextStyle(

                            fontSize: 16.0,

                            fontWeight: FontWeight.bold,


                          ),

                        )


                      ],

                    ),





                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[


                        Radio(

                          value: 4,

                          groupValue: _myTaskType,

                          onChanged: _handleTaskType,

                          activeColor: Color(0xFFFA7397),

                        ),


                        Text(
                          
                          "Party",

                          style: TextStyle(

                            fontSize: 16.0,

                            fontWeight: FontWeight.bold,


                          ),

                        )


                      ],

                    ),




                    
                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[


                        Radio(

                          value: 5,

                          groupValue: _myTaskType,

                          onChanged: _handleTaskType,

                          activeColor: Color(0xFFFA7397),

                        ),


                        Text(
                          
                          "Others",

                          style: TextStyle(

                            fontSize: 16.0,

                            fontWeight: FontWeight.bold,


                          ),

                        )


                      ],

                    ),



                  ],

                ),

                //------ENDO OF THE RADIO BUTTON COLUMN -------



                //---'Submit or Cancel' Raised Buttons Begins ---

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                  children: <Widget>[


                    RaisedButton(


                      color: Color(0xfffa7397),


                      onPressed: (){

                        Navigator.of(context).pop();

                      },


                      child: Text(

                        "Cancel",

                        style: TextStyle(

                          color: Color(0xfffdde42), 

                        ),

                      ),


                    ),



                    RaisedButton(


                      color: Color(0xfffa7397),


                      onPressed: (){

                        fireServ.createTODOTask(_taskNameController.text, _taskDetailsController.text,_taskDateController.text,_taskTimeController.text,taskVal).then((_) {
                          
                        Navigator.pop(context);

                      });

                      },


                      child: Text(

                        "Submit",

                        style: TextStyle(

                          color: Color(0xfffdde42), 

                        ),

                      ),


                    ),


                  ],

                ),


              ],

            ),
      
          )

        ]

      )

    );

  }

}




