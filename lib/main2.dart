import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

//void main() => runApp(MyApp());


class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  final List<int> numbers = [1, 2, 3,4];
  final List<String> title = ['삐모', '뿡자', '삐비', '그레이푸', 'hi'];
  final List<String> subtitle = ['식사영어를 배우자!', '항공영어를 배우자!', '길묻기영어를 배우자!', '물건 살 때 영어를 배우자!', 'hi'];
  final List<String> images = ['assets/penguin.png','assets/tree.png','assets/bee.png','assets/grapes.png'];
  final List<String> sentence = ['커피 한 잔 주세요', '영수증 주세요', '앉을 자리가 있나요?', '식사 예약 했습니다'];

  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Text('test'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Title'),
                  SizedBox(height: 8.0),
                  Text('Secondary Text'),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return cards;
  }

  Widget _customeAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.0),
      child: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        flexibleSpace: Container(
          child: Row(
            children: <Widget>[
              Container(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Container(height: 60.0,),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                    child: Text('문장들',style: TextStyle(
                      fontSize: 40.0,
                      //fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                      color: Colors.black,
                    ),),
                  ),
                  Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Color(0xffDCE7F9),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    //width: ,
                    child: Center(
                      child: Text(
                        '구체적인 문장들을 배워봐요!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
                    child: Text(
                      '보아라!',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_customeAppbar(),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: ListView.builder(
             padding: EdgeInsets.all(8),
              itemCount: numbers.length,
              itemBuilder : (BuildContext context, int index){
               return GestureDetector(
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => MyHomePage()),
                   );
                 },
                 child: ListTile(
                   //height: 80,
                   //color: Colors.yellow,
                   title: Container(
                     height: 70,
                     child:Row(
                       children: <Widget>[
                         Center(
                           child: Stack(
                             children: <Widget>[
                               Container(
                                 width: 55,
                                 height: 55,
                                 decoration: new BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: Color(0xFFFFFFFF),
                                   boxShadow: [
                                     new BoxShadow(
                                       color: Colors.grey[400],
                                       offset: new Offset(0.0, 5.0),
                                       blurRadius: 5.0,
                                     ),
                                   ],
                                 ),
                               ),
                               Container(
                                 child : Image.asset(
                                   images[index],
                                   width: 55,
                                   height: 55,
                                   alignment: Alignment(0.0, 0.0),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Container(
                           padding: EdgeInsets.all(10.0),
                           child: Text(
                             sentence[index],
                             style: TextStyle(
                               fontSize: 17,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   trailing: Icon(
                     Icons.panorama_fish_eye,
                     size: 40,
                   )
                 ),
               );
              }
            ),
          ),
        ],
      ),
    );
  }
}

