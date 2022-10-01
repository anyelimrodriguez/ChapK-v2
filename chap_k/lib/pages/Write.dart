import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Write",
        ),
        backgroundColor: const Color(0xFFC3B1E1),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [
          const SizedBox(height: 20.0, width: 20.0),
          Row(
            children: const <Widget> [
              Flexible(
                child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write',
                  filled: true,
                  fillColor: Color(0xFFEBEBEB),
                  ),
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 100.0,width: 100.0),
              PostButton(),
                
            ]
          ),
        ]
      ),
    );
  }
}

class PostButton extends StatelessWidget{
  PostButton({super.key});
  final CollectionReference _post = FirebaseFirestore.instance.collection('Posts');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          SizedBox(height: 20.0, width: 20.0),
          Text(
            "Post",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0, width: 20.0),
        ]
      ),
      onPressed: () async {
        final String story = "hello";
        if (story != null) {
          await _post.add({"Story": story});
        }
        
        Navigator.pushNamed(context, '/Home');
      },
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }

}