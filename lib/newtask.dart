import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'appBar.dart';



class NewTask extends StatefulWidget {

  NewTask();

  @override
  _NewTaskState createState() => _NewTaskState();

}



class _NewTaskState extends State<NewTask> {



  //---1st Create the variables & constructors---- BEGINS---

  String taskname, taskdetails, taskDate, taskTime;


  getTaskName(taskname){

    this.taskname = taskname;

  }


  getTaskDetails(taskdetails){

    this.taskdetails = taskdetails;

  }


  getTaskDate(taskDate){

    this.taskDate = taskDate;

  }


  getTaskTime(taskTime){

    this.taskTime = taskTime;

  }

  //---END OF THE---1st Create the variables & constructors---




  //---Then Create RADIO BUTTONS---- BEGINS---

  int _myTaskType = 0;

  String taskVal;



  void _handleTaskType(int value){


    setState(() {


      _myTaskType = value;


      switch(_myTaskType){

        case 1:

          taskVal = 'travel';

          break;

        
        case 2:

          taskVal = 'shopping';

          break;


        case 3:

          taskVal = 'gym';

          break;

        
        case 4:

          taskVal = 'party';

          break;


        case 4:

          taskVal = 'others';

          break;

      }

    });

  }

  //---END OF Creating RADIO BUTTONS---




  /* HERE IS THE MAIN PART OF THE APP WHICH ADD A
  * 
  *  DATA TO FIREBASE  
  */


  //----3rd  "createData" Functions BEGINS-----

  createData(){


    DocumentReference ds = Firestore.instance.collection('todolist1').document(taskname);


    Map<String, dynamic> tasks = {

      "taskname": taskname,

      "taskdetails": taskdetails,

      "taskdate": taskDate,

      "tasktime": taskTime,

      "tasktype": taskVal,

    };

    //---Here In Order to SET the VALUE we use DocumentReference "dc"---

    ds.setData(tasks).whenComplete((){

      print("Task created");

    });

  }

  //----END OF THE 3rd  "createData" Functions-----






  @override
  Widget build(BuildContext context) {

    //2nd create the APP BAR and Body

    return Scaffold(
      
      resizeToAvoidBottomInset: false,

      body: Column(

        children: <Widget>[

          // _myAppBar(),

          MyAppBar(),

          Container(

            width: MediaQuery.of(context).size.width,

            height: MediaQuery.of(context).size.height - 80, //"80" is AppBar Height


            child: ListView(


              children: <Widget>[


                Padding(

                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                    onChanged: (String name){

                      getTaskName(name);

                    },

                    decoration: InputDecoration(

                      labelText: "Task: "

                    ),

                  ),
                  
                ),



                Padding(

                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                    onChanged: (String taskdetails){

                      getTaskDetails(taskdetails);

                    },

                    decoration: InputDecoration(

                      labelText: "Details: "

                    ),

                  ),
                  

                ),



                Padding(


                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                    onChanged: (String taskdate){

                      getTaskDate(taskdate);

                    },

                    decoration: InputDecoration(

                      labelText: "Date: "

                    ),

                  ),
                  

                ),



                Padding(


                  padding: EdgeInsets.only(left: 16.0, right: 16.0),

                 
                  child: TextField(

                    onChanged: (String tasktime){

                      getTaskTime(tasktime);

                    },

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



                //------RADIO BUTTON WITH DETAILS COLUMN BEGINS-------
                
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

                          //RADIO BUTTON INNER COLOR
                          activeColor: Color(0xfff06292),

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

                          //RADIO BUTTON INNER COLOR
                          activeColor: Color(0xfff06292),

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

                          //RADIO BUTTON INNER COLOR
                          activeColor: Color(0xfff06292),

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

                          //RADIO BUTTON INNER COLOR
                          activeColor: Color(0xfff06292),

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

                          //RADIO BUTTON INNER COLOR
                          activeColor: Color(0xfff06292),

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

                //------ENDO OF THE RADIO BUTTON WITH DETAILS COLUMN -------





                //---'SUBMIT or CANCEL' Raised Buttons Begins ---

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



                    //---SUBMIT Button results in ADDING CONTACT to the DATABASE---

                    RaisedButton(


                      color: Color(0xfffa7397),


                      onPressed: (){

                        createData();

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

                //---SUBMIT Button results in ADDING CONTACT to the DATABASE---

                //---End of the Submit or Cancel Raised Buttons  ---


              ],

            ),

          ),

        ],

      ),
      
    );
    
  }

}



