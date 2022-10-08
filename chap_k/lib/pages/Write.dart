import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
/*
  Color palette: Honeydew -> Color(0xFFF1FFE7)
  Color palette: Wisteria(the purple) -> Color(0xFFC3B1E1)
  Color palette: Space Cadet (dark) -> Color(0xFF1A1B41)
*/
// Setting the Global Variables for the Window Height and Width
double HeightOfScreen=0;
double WidthOfScreen=0;

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final TextEditingController _writeBox = TextEditingController();
  final ValueNotifier<String> buffer = new ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    // Update the window dimensions with the Media Query
    HeightOfScreen=MediaQuery.of(context).size.height;
    WidthOfScreen=MediaQuery.of(context).size.width; 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Write",
          style: TextStyle(
            color: Color(0xFFF1FFE7),
          ),
        ),
        backgroundColor: const Color(0xFF1A1B41),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [
          const SizedBox(height: 20.0, width: 20.0),
          Row(
            children: <Widget> [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                  controller: _writeBox,
                  onChanged:(value) { buffer.value = value;},
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  maxLength: 300,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Write',
                    labelStyle: TextStyle(
                      color: Color(0xFF1A1B41),
                    ),
                    filled: true,
                    //hoverColor: Colors.green,
                    fillColor: Color(0xFFEBEBEB),
                    
                    ),
                  ),
                ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: HeightOfScreen/10, width: WidthOfScreen/1.75),
              ValueListenableBuilder<String>(
                valueListenable: buffer,
                builder: (context, value, child) {
                  return PostButton(newStory: buffer);
                }
              ),
                
            ]
          ),
        ]
      ),
    );
  }
}

class PostButton extends StatelessWidget{
  PostButton({super.key, required this.newStory});
  final CollectionReference _post = FirebaseFirestore.instance.collection('Posts');
  final ValueListenable<String> newStory;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final String story = newStory.value;
        final String testEmptyStory = story.trim(); //trims whitespace, if user only entered whitespace, this will be empty
        if (story != ""&&testEmptyStory.isNotEmpty) {
          await _post.add({"Story": story});
        }
        
        Navigator.pushNamed(context, '/Home');
      },
      style: TextButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color(0xFF1A1B41),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget> [
          SizedBox(height: 20.0, width: 20.0),
          Text(
            "Post",
            style: TextStyle(
              color: Color(0xFFF1FFE7),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0, width: 20.0),
        ]
      ),
    );
  }

}