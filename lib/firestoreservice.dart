
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'task.dart';


//Creating 'Collection Reference'
final CollectionReference  myCollection = Firestore.instance.collection('todolist1');



//Creating 'Firestoreservice'
class FirestoreService{


  //Creating 'createToDoTask' Method
  Future<Task> createTODOTask(String taskname, String taskdetails, String taskdate, String tasktime, String tasktype) async{


    //Here creating 'Transaction Handler', it'll wait our transaction to get the particular document
    final TransactionHandler createTransaction = (Transaction t) async{


      //Creating 'Document Snapshot'
      final DocumentSnapshot docSnap = await t.get(myCollection.document());


      //Creating instance of our task
      final Task task = new Task(taskname, taskdetails, taskdate, tasktime, tasktype);


      //Here we'll use 'Map' & send it to back to Firestore
      final Map<String, dynamic> data = task.toMap();


      //Here we'll wait to set
      await t.set(docSnap.reference, data);

      return data;

    };


    
    //---Here second part that we should run our transaction--- 

    //Run created tansaction 
    return Firestore.instance.runTransaction(createTransaction).then((mapData){

      return Task.fromMap(mapData);

    }).catchError((error){

      print('error: $error');

      return null;

    });


  }



  //To retrieve the detail from FireStore we use 'getTaskList'

  Stream<QuerySnapshot> getTaskList({int offset, int limit}){

    //Declaring Reference of our collection
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();


    if(offset != null){

      snapshots = snapshots.skip(offset);

    }


    if(limit != null){

      snapshots = snapshots.take(limit);

    }

    return snapshots;

  }

}



