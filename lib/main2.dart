import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<int> numbers = [1, 2, 3,4];
  final List<String> title = ['삐모', '뿡자', '삐비', '그레이푸', 'hi'];
  final List<String> subtitle = ['식사영어를 배우자!', '항공영어를 배우자!', '길묻기영어를 배우자!', '물건 살 때 영어를 배우자!', 'hi'];
  final List<String> images = ['assets/penguin.png','assets/tree.png','assets/bee.png','assets/grapes.png'];

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
                    child: Text('단원들',style: TextStyle(
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
                      color: Color(0xfff9dcea),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    //width: ,
                    child: Center(
                      child: Text(
                        '여러 여행 상황 속에서 쓰이는 영어를 배워봐요!',
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
                      '척척박사 친구들',
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
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this would produce 2 rows.
              crossAxisCount: 2,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(4, (index) {
                //return _buildCard(index);
                return Center(
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 130,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFEAE9E9),
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
                                width: 100,
                                height: 100,
                                alignment: Alignment(0.0, 1.0),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          title[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                          ),
                        ),
                        Text(
                          subtitle[index],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

