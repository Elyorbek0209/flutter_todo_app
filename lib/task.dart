class Task{

  //Declaring Task Variables

  String _taskname;

  String _taskdetails;

  String _taskdate;

  String _tasktime;

  String _tasktype;


  //Declaring Task Constructor

  Task(

    this._taskname,

    this._taskdetails,

    this._taskdate,

    this._tasktime,

    this._tasktype

  );



  //Creating the getter method

  String get taskname => _taskname;

  String get taskdetails => _taskdetails;

  String get taskdate => _taskdate;

  String get tasktime => _tasktime;

  String get tasktype => _tasktype;



  //Creating the "toMap" Method so we can deserialize the DATA which we received from FireStore

  Map<String, dynamic> toMap(){


    var map = new Map<String, dynamic>();

    map['taskname'] = _taskname;

    map['taskdetails'] = _taskdetails;

    map['taskdate'] = _taskdate;

    map['tasktime'] = _tasktime;

    map['tasktype'] = _tasktype;

    return map;


  }



  //Creating the "fromMap" Method 

  Task.fromMap(Map<String, dynamic> map){

    this._taskname = map['taskname'];

    this._taskdetails = map['taskdetails'];

    this._taskdate = map['taskdate'];

    this._tasktime = map['tasktime'];

    this._tasktype = map['tasktype'];

  }


}