import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double wH = MediaQuery.of(context).size.height;
    double wW = MediaQuery.of(context).size.width;
    double rm = wH;
    rm = (wH < 700) ? 70 : rm / 10;
    rm - 1;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                minHeight: 70, //minimum height
                maxHeight: wH,
              ),
              color: Color(0xffC3B1E1),
              height: wH / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.public, color: Colors.red),
                    label: Text(
                      'Language',
                      style: TextStyle(
                          color: Colors.blue, fontSize: 30, letterSpacing: 2),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(50, 20),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  Container(
                      constraints: BoxConstraints(
                        minHeight: 100, //minimum height
                        minWidth: 100,
                        maxHeight: wH,
                        maxWidth: wW,
                      ),
                      child: Image(
                        image: AssetImage('../../imgs/HomeLogo.png'),
                        height: wH / 10,
                        width: wW / 10,
                      )),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: Icon(Icons.logout, color: Color(0xffad5a54)),
                    label: Text(
                      'Sign Out',
                      style: TextStyle(
                          color: Colors.blue, fontSize: 30, letterSpacing: 2),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade200,
                      minimumSize: Size(50, 20),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: wW / 6, vertical: 0),
                child: Ink(
                  color: Colors.white,
                  height: wH - rm,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundImage:
                                  AssetImage('../../imgs/DummyImgs/pfp.png'),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'HI',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                )),
                            // color: Color(0xff9d0505),
                            margin: EdgeInsets.only(right: 20),
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundImage:
                                  AssetImage('../../imgs/DummyImgs/pfp2.png'),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'HOLA',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                )),
                            // color: Color(0xff9d0505),
                            margin: EdgeInsets.only(right: 20),
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundImage:
                                  AssetImage('../../imgs/DummyImgs/pfp3.png'),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'CIAO',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                )),
                            // color: Color(0xff9d0505),
                            margin: EdgeInsets.only(right: 20),
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundImage:
                                  AssetImage('../../imgs/DummyImgs/pfp4.png'),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'BONJOUR',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                )),
                            // color: Color(0xff9d0505),
                            margin: EdgeInsets.only(right: 20),
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundImage:
                                  AssetImage('../../imgs/DummyImgs/pfp5.png'),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'The quick brown fox jumps over the lazy dog',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                )),
                            // color: Color(0xff9d0505),
                            margin: EdgeInsets.only(right: 20),
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          )),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
        floatingActionButton: Container(
          // width: 100,
          height: 70,
          width: wW / 12,
          constraints: BoxConstraints(
            minWidth: 80,
            maxHeight: wH,
            maxWidth: wW,
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Write');
            },
            child: Text(
              'Write',
              style: TextStyle(fontSize: 25, letterSpacing: 2),
            ),
            backgroundColor: Colors.purple,
            splashColor: Colors.red,
            hoverColor: Color(0xff35139d),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
          ),
        ));
  }
}
