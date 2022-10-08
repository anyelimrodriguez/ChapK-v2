import "package:flutter/material.dart";
/*
  Color palette: Honeydew -> Color(0xFFF1FFE7)
  Color palette: Wisteria(the purple) -> Color(0xFFC3B1E1)
  Color palette: Space Cadet (dark) -> Color(0xFF1A1B41)
*/
class ViewStory extends StatefulWidget {
  // final String story;
  const ViewStory({super.key});

  @override
  State<ViewStory> createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    double wH = MediaQuery.of(context).size.height;
    double wW = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Story",
          ),
          backgroundColor: const Color(0xFF1A1B41),
          centerTitle: true,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: wW / 100, vertical: wH / 100),
          child: SizedBox.expand(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFF1FFE7),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  args.toString(),
                  style: const TextStyle(fontSize: 36, color: Color(0xFF1A1B41)),
                ),
              ),
            ),
          ),
        ));
  }
}
