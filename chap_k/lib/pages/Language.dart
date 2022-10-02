import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<Lang> langs = [
    Lang(name: 'Afrikaans', code: 'af'),
    Lang(name: 'Shqip', code: 'sq'),
    Lang(name: 'عربي', code: 'ar'),
    Lang(name: 'Հայերէն', code: 'hy'),
    Lang(name: 'آذربایجان دیلی', code: 'az'),
    Lang(name: 'Euskara', code: 'eu'),
    Lang(name: 'Беларуская', code: 'be'),
    Lang(name: 'Български', code: 'bg'),
    Lang(name: 'Català', code: 'ca'),
    Lang(name: '中文简体', code: 'zh-cn'),
    Lang(name: '中文繁體', code: 'zh-tw'),
    Lang(name: 'Hrvatski', code: 'hr'),
    Lang(name: 'Čeština', code: 'cs'),
    Lang(name: 'Dansk', code: 'da'),
    Lang(name: 'Nederlands', code: 'nl'),
    Lang(name: 'English', code: 'en'),
    Lang(name: 'Eesti keel', code: 'et'),
    Lang(name: 'Filipino', code: 'tl'),
    Lang(name: 'Suomi', code: 'fi'),
    Lang(name: 'Français', code: 'fr'),
    Lang(name: 'Galego', code: 'gl'),
    Lang(name: 'ქართული', code: 'ka'),
    Lang(name: 'Deutsch', code: 'de'),
    Lang(name: 'Ελληνικά', code: 'el'),
    Lang(name: 'Kreyòl ayisyen', code: 'ht'),
    Lang(name: 'עברית', code: 'iw'),
    Lang(name: 'हिन्दी', code: 'hi'),
    Lang(name: 'Magyar', code: 'hu'),
    Lang(name: 'Íslenska', code: 'is'),
    Lang(name: 'Bahasa Indonesia', code: 'id'),
    Lang(name: 'Gaeilge', code: 'ga'),
    Lang(name: 'Italiano', code: 'it'),
    Lang(name: '日本語', code: 'ja'),
    Lang(name: '한국어', code: 'ko'),
    Lang(name: 'Latviešu', code: 'lv'),
    Lang(name: 'Lietuvių kalba', code: 'lt'),
    Lang(name: 'Македонски', code: 'mk'),
    Lang(name: 'Malay', code: 'ms'),
    Lang(name: 'Malti', code: 'mt'),
    Lang(name: 'Norsk', code: 'no'),
    Lang(name: 'فارسی', code: 'fa'),
    Lang(name: 'Polski', code: 'pl'),
    Lang(name: 'Português', code: 'pt'),
    Lang(name: 'Română', code: 'ro'),
    Lang(name: 'Русский', code: 'ru'),
    Lang(name: 'Српски', code: 'sr'),
    Lang(name: 'Slovenčina', code: 'sk'),
    Lang(name: 'Slovensko', code: 'sl'),
    Lang(name: 'Español', code: 'es'),
    Lang(name: 'Kiswahili', code: 'sw'),
    Lang(name: 'Svenska', code: 'sv'),
    Lang(name: 'ไทย', code: 'th'),
    Lang(name: 'Türkçe', code: 'tr'),
    Lang(name: 'Українська', code: 'uk'),
    Lang(name: 'اردو', code: 'ur'),
    Lang(name: 'Tiếng Việt', code: 'vi'),
    Lang(name: 'Cymraeg', code: 'cy'),
    Lang(name: 'ייִדיש', code: 'yi'),
  ];

  @override
  Widget build(BuildContext context) {
    double wH = MediaQuery.of(context).size.height;
    double wW = MediaQuery.of(context).size.width;
    double rm = wH;
    rm = (wH < 700) ? 70 : rm / 10;
    rm - 1;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Language",
          ),
          backgroundColor: const Color(0xFFC3B1E1),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: wW / 6, vertical: 0),
            child: Ink(
                color: Color.fromARGB(255, 247, 255, 229),
                height: wH - rm,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  children: langs
                      .map((la) => LangWidget(
                            name: la.name,
                            code: la.code,
                          ))
                      .toList(),
                ))));
  }
}

class Lang {
  String name;
  String code;

  Lang({required this.name, required this.code});
}

class LangWidget extends StatelessWidget {
  final String name;
  final String code;
  LangWidget({super.key, required this.name, required this.code});

  final CollectionReference _user =
      FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 18, 105, 175)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue.withOpacity(0.12);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Colors.blue.withOpacity(0.36);
                return null; // Defer to the widget's default.
              },
            ),
          ),
          onPressed: () {
            _user.doc('7VYOXEZk6wru9yHkGOdp').update({'Language': code});
            Navigator.pushNamed(context, '/Home');
          },
          child: Text(
            name,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
