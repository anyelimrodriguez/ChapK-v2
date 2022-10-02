import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:chap_k/pages/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [
    Post(pfp: '../../imgs/DummyImgs/pfp.png', story: 'HI'),
    Post(pfp: '../../imgs/DummyImgs/pfp2.png', story: 'HOLA'),
    Post(pfp: '../../imgs/DummyImgs/pfp3.png', story: 'CIAO'),
    Post(pfp: '../../imgs/DummyImgs/pfp4.png', story: 'BONJOUR'),
    Post(
        pfp: '../../imgs/DummyImgs/pfp5.png',
        story: 'The quick brown fox jumps over the lazy dog')
  ];

  final CollectionReference _posts =
      FirebaseFirestore.instance.collection('Posts');

  @override
  Widget build(BuildContext context) {
    double wH = MediaQuery.of(context).size.height;
    double wW = MediaQuery.of(context).size.width;
    double rm = wH;
    rm = (wH < 700) ? 70 : rm / 10;
    rm - 1;
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: StreamBuilder(
            stream: _posts.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return Column(
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
                          const HomeLanguageButton(),
                          Container(
                              constraints: BoxConstraints(
                                minHeight: 100, //minimum height
                                minWidth: 100,
                                maxHeight: wH,
                                maxWidth: wW,
                              ),
                              child: Image(
                                image:
                                    const AssetImage('../../imgs/HomeLogo.png'),
                                height: wH / 10,
                                width: wW / 10,
                              )),
                          HomeSignoutButton(),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: wW / 6, vertical: 0),
                        child: Ink(
                            color: Colors.white,
                            height: wH - rm,
                            child: ListView.builder(
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot docsnap =
                                    streamSnapshot.data!.docs[index];
                                final random = new Random();
                                int inde = random.nextInt(4);
                                return PostWidget(
                                  usrPfp: posts[inde].pfp,
                                  usrStory: docsnap['Story'],
                                );
                              },
                            )))
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
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
            backgroundColor: Colors.purple,
            splashColor: Colors.red,
            hoverColor: const Color(0xff35139d),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: const Text(
              'Write',
              style: TextStyle(fontSize: 25, letterSpacing: 2),
            ),
          ),
        ));
  }
}

class Post {
  String pfp;
  String story;

  Post({required this.pfp, required this.story});
}

class PostWidget extends StatelessWidget {
  final String usrPfp;
  final String usrStory;
  const PostWidget({super.key, required this.usrPfp, required this.usrStory});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage(usrPfp),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context, '/ViewStory');
              Navigator.pushNamed(context, '/ViewStory', arguments: usrStory);
            },
            child: Container(
              // color: Color(0xff9d0505),
              margin: const EdgeInsets.only(right: 20),
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),

              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  usrStory,
                  style: const TextStyle(fontSize: 12, color: Colors.purple),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeLanguageButton extends StatelessWidget {
  const HomeLanguageButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.public, color: Colors.red),
      label: const Text(
        'Language',
        style: TextStyle(color: Colors.blue, fontSize: 30, letterSpacing: 2),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: const Size(50, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}

class HomeSignoutButton extends StatelessWidget {
  HomeSignoutButton({super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        _auth.signOut();
        Navigator.pushNamed(context, '/');
      },
      icon: const Icon(Icons.logout, color: Color(0xffad5a54)),
      label: const Text(
        'Sign Out',
        style: TextStyle(color: Colors.blue, fontSize: 30, letterSpacing: 2),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade200,
        minimumSize: const Size(50, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
