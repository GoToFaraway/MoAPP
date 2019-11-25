import 'package:classwork/add.dart';
import 'package:classwork/detail.dart';
import 'package:classwork/item.dart';
import 'package:classwork/profile.dart';
import 'package:classwork/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ranking extends StatefulWidget {

  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {

  final Firestore _firestore = Firestore.instance;
  bool _isFetched = false;

  bool _isDescending = true;


  Widget _buildRankingView(List<User> userList) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: userList.length,
        itemBuilder: (_,index){

          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Row(
                        children: <Widget>[
                            SizedBox(width: 30.0),
                            Text(userList[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Text(userList[index].score.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0
                              ),
                            ),
                          ],
                    ),
                  ],
              )
          );
        }
    );
  }

  Stream<QuerySnapshot> _getStream() {
    return  _firestore.collection('users')
        .orderBy('score',descending: _isDescending)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _isFetched ? Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => Item())) : null,
        ),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => Add())))],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(width: 10.0),
              DropdownButton<String>(
                value: _isDescending?'DESC':'ASC',
                items: <String>['ASC','DESC'].map((val){
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                }).toList(),
                onChanged: (val){
                  setState(() {
                    _isDescending = val=='ASC'?false:true;
                  });
                },
              )
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: _getStream(),
                builder: (context, snapshot){
                  if(snapshot.hasData && snapshot.data.documents.isNotEmpty) {
                    _isFetched = true;
                    var userList = snapshot.data.documents.map((snapshot)
                    => User.fromSnapshot(snapshot)).toList();
                    return _buildRankingView(userList);
                  }
                  return Container();
                }
            ),
          ),
        ],
      ),
    );
  }
}
