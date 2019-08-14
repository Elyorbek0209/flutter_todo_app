import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class MyAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    

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

                      Navigator.pop(context);

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
