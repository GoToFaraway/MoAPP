import 'package:classwork/global.dart';
import 'package:classwork/login.dart';
import 'package:classwork/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  TextEditingController nameController;

  bool _isFetched = false;
  User _user = User();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    //nameController = TextEditingController(text: widget.product.name);

  }

  Future<void> _update() async {

    await Firestore.instance.collection('users')
        .document(Global.currentUser.uid)
        .updateData({
      'name': _usernameController.text,
    });
  }

  final _usernameController = TextEditingController();
  int userListNumber;

  Widget build(BuildContext context) {
    child: StreamBuilder<QuerySnapshot>(
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.data.documents.isNotEmpty) {
            var userList = snapshot.data.documents.map((snapshot)
            => User.fromSnapshot(snapshot)).toList();
          }
          return Container();
        }
    );

    //for(userListNumber = 0; userListNumber < userList.length; userListNumber++){
//      if(userList[userListNumber].uerID == Global.currentUser.uid){
//        break;
//      }
//    }

    return Scaffold(

      appBar: AppBar(
        title: Text('My Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app), //로그아웃
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (_) => Login()
              ), (_) => false);
            },
          )//log-out
        ],
      ),

      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance.collection('users').document(Global.currentUser.uid).get(),
          builder: (context, snapshot){
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
            User user = User.fromSnapshot(snapshot.data);
            _user = user;
            _isFetched = true;
            return Column(
              children: [
                Container(
                    width: 200.0,
                    height: 200.0,
                    child: Image.network(Global.currentUser.photoUrl ?? Global.defaultImage) //get user image
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 45.0),
                    Text(
                      'Name : ' + user.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(width: 35.0),

                    IconButton(
                      icon: Icon(Icons.cached),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Text('Change User Name'),
                                content: TextField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'please enter user id'
                                  ),
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Change"),
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      await _update();
                                    },
                                  ),
                                ],
                              );
                            }
                        );
                      },
                    ),
                    Text(
                      'change the name',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0
                      ),
                      maxLines: 1,
                    ),
                  ],
                ), //userId

                Row(
                    children: <Widget>[
                      SizedBox(width: 45.0),
                      Text(
                        'Score : ' + user.score.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                        maxLines: 1,
                      ),
                    ]
                ),

                //Text(Global.currentUser.uid),
                SizedBox(height: 10.0),
                Container(
                  height: 2.0,
                  width: MediaQuery.of(context).size.width*0.9,
                  color: Colors.grey.withOpacity(0.2),
                ),//draw line
                SizedBox(height: 10.0),
                Text(Global.currentUser.email ?? 'anonymous') //email of user
              ],
            );
          }
      ),
    );
  }
}
