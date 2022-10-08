import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:chap_k/pages/auth.dart';
import 'package:translator/translator.dart';

/*
  Color palette: Honeydew -> Color(0xFFF1FFE7)
  Color palette: Wisteria(the purple) -> Color(0xFFC3B1E1)
  Color palette: Space Cadet (dark) -> Color(0xFF1A1B41)
*/

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [
    Post(pfp: 'imgs/pfp.png', story: 'HI'),
    Post(pfp: 'imgs/pfp2.png', story: 'HOLA'),
    Post(pfp: 'imgs/pfp3.png', story: 'CIAO'),
    Post(pfp: 'imgs/pfp4.png', story: 'BONJOUR'),
    Post(
        pfp: 'imgs/pfp5.png',
        story: 'The quick brown fox jumps over the lazy dog')
  ];

  final CollectionReference _posts =
      FirebaseFirestore.instance.collection('Posts');

  final CollectionReference _user =
      FirebaseFirestore.instance.collection('Users');

  late Future<String> writeFuture;
  late Future<String> postFuture;

  List<int> randPFP = [];

  @override
  void initState() {
    super.initState();
    writeFuture = _Translate('Write', 'en');
    postFuture = _Translate('', 'en');
    for (int i = 0; i < 50; i++) {
      final random = Random();
      int randNum = random.nextInt(4);
      randPFP.add(randNum);
    }
  }

  @override
  Widget build(BuildContext context) {
    double wH = MediaQuery.of(context).size.height;
    double wW = MediaQuery.of(context).size.width;
    double rm = wH;
    rm = (wH < 700) ? 70 : rm / 10;
    rm - 1;

    return Scaffold(
        backgroundColor: Color(0xFFF1FFE7),//Colors.grey.shade300,
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
                      color: const Color(0xFF1A1B41),
                      height: wH / 10,
                      child: Flex(
                        direction: Axis.horizontal,//wH>550?Axis.horizontal:Axis.vertical,
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
                                image: const AssetImage('imgs/HomeLogo.png'),
                                height: wH / 10,
                                width: wW / 10,
                              )),
                          const HomeSignoutButton(),
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
                                var randIndex = randPFP[index];
                                return PostWidget(
                                  usrPfp: posts[randIndex].pfp,
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
            backgroundColor: const Color(0xFF1A1B41),
            splashColor: Colors.red,
            hoverColor: const Color(0xff35139d),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: StreamBuilder(
                stream: _user.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    final DocumentSnapshot docsnap =
                        streamSnapshot.data!.docs[0];
                    writeFuture = _Translate('Write', docsnap['Language']);
                    return FutureBuilder<String>(
                        future: writeFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data.toString(),
                              style: const TextStyle(
                                  fontSize: 25, letterSpacing: 2),
                            );
                          } else {
                            return const Text(
                              '',
                              style: TextStyle(fontSize: 25, letterSpacing: 2),
                            );
                          }
                        });
                  } else {
                    return Container();
                  }
                }),
          ),
        ));
  }
}

class Post {
  String pfp;
  String story;

  Post({required this.pfp, required this.story});
}

class PostWidget extends StatefulWidget {
  final String usrPfp;
  final String usrStory;
  const PostWidget({super.key, required this.usrPfp, required this.usrStory});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late Future<String> postFuture;

  final CollectionReference _user =
      FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    super.initState();
    postFuture = _Translate('', 'en');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage(widget.usrPfp),
          ),
        ),
        StreamBuilder(
            stream: _user.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                final DocumentSnapshot docsnap = streamSnapshot.data!.docs[0];
                postFuture = _Translate(widget.usrStory, docsnap['Language']);
                return FutureBuilder<String>(
                    future: postFuture,
                    builder: (BuildContext ctx, AsyncSnapshot<String> snpsht) {
                      if (snpsht.hasData) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              //Navigator.pushNamed(context, '/ViewStory');
                              Navigator.pushNamed(context, '/ViewStory',
                                  arguments: snpsht.data.toString());
                            },
                            child: Container(
                              // color: Color(0xff9d0505),
                              margin: const EdgeInsets.only(right: 20),
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),

                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  snpsht.data.toString(),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Container();
              }
            }),
      ],
    );
  }
}

class HomeLanguageButton extends StatefulWidget {
  const HomeLanguageButton({super.key});

  @override
  State<HomeLanguageButton> createState() => _HomeLanguageButtonState();
}

class _HomeLanguageButtonState extends State<HomeLanguageButton> {
  late Future<String> langFuture;
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    super.initState();
    langFuture = _Translate('Language', 'en');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _user.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final DocumentSnapshot docsnap = streamSnapshot.data!.docs[0];
            langFuture = _Translate('Language', docsnap['Language']);
            return ElevatedButton.icon(
              onPressed: () async {
                Navigator.pushNamed(context, '/Language');
              },
              icon: const Icon(Icons.public, color: Colors.red),
              label: FutureBuilder<String>(
                  future: langFuture,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                            color: Colors.blue, fontSize: 20, letterSpacing: 2),
                      );
                    } else {
                      return const Text(
                        '',
                        style: TextStyle(
                            color: Colors.blue, fontSize: 30, letterSpacing: 2),
                      );
                    }
                  }),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(50, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

class HomeSignoutButton extends StatefulWidget {
  const HomeSignoutButton({super.key});

  @override
  State<HomeSignoutButton> createState() => _HomeSignoutButtonState();
}

class _HomeSignoutButtonState extends State<HomeSignoutButton> {
  final AuthService _auth = AuthService();
  late Future<String> signFuture;

  final CollectionReference _user =
      FirebaseFirestore.instance.collection('Users');

  @override
  void initState() {
    super.initState();
    signFuture = _Translate('Sign Out', 'en');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _user.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final DocumentSnapshot docsnap = streamSnapshot.data!.docs[0];
            signFuture = _Translate('Sign Out', docsnap['Language']);
            print(docsnap['Language']);
            return ElevatedButton.icon(
              onPressed: () async {
                _auth.signOut();
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(Icons.logout, color: Color(0xffad5a54)),
              label: FutureBuilder<String>(
                  future: signFuture,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                            color: Colors.blue, fontSize: 20, letterSpacing: 2),
                      );
                    } else {
                      return const Text(
                        '',
                        style: TextStyle(
                            color: Colors.blue, fontSize: 20, letterSpacing: 2),
                      );
                    }
                  }),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                minimumSize: const Size(50, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

Future<String> _Translate(String sentence, String code) async {
  final translator = GoogleTranslator();
  try {
    var translation =
        await translator.translate(sentence, from: 'en', to: code);
    return translation.text;
  } catch (e) {
    print("the sentence is $sentence translate it to-> $code");
  }
  return ""; //if there's an error in translation, don't do anything
}
