import "package:flutter/material.dart";

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
    Lang(name: '中文简体', code: 'zh-CN'),
    Lang(name: '中文繁體', code: 'zh-TW'),
    Lang(name: 'Hrvatski', code: 'hr'),
    Lang(name: 'Čeština', code: 'cs'),
    Lang(name: 'Dansk', code: 'da'),
    Lang(name: 'Nederlands', code: 'nl'),
    Lang(name: 'English', code: 'en'),
    Lang(name: 'Eesti keel', code: 'et'),
    Lang(name: '', code: 'tl'),
    Lang(name: '', code: 'fi'),
    Lang(name: '', code: 'fr'),
    Lang(name: '', code: 'gl'),
    Lang(name: '', code: 'ka'),
    Lang(name: '', code: 'de'),
    Lang(name: '', code: 'el'),
    Lang(name: '', code: 'ht'),
    Lang(name: '', code: 'iw'),
    Lang(name: '', code: 'hi'),
    Lang(name: '', code: 'hu'),
    Lang(name: '', code: 'is'),
    Lang(name: '', code: 'id'),
    Lang(name: '', code: 'ga'),
    Lang(name: '', code: 'it'),
    Lang(name: '', code: 'ja'),
    Lang(name: '', code: 'ko'),
    Lang(name: '', code: 'lv'),
    Lang(name: '', code: 'lt'),
    Lang(name: '', code: 'mk'),
    Lang(name: '', code: 'ms'),
    Lang(name: '', code: 'mt'),
    Lang(name: '', code: 'no'),
    Lang(name: '', code: 'fa'),
    Lang(name: '', code: 'pl'),
    Lang(name: '', code: 'pt'),
    Lang(name: '', code: 'ro'),
    Lang(name: '', code: 'ru'),
    Lang(name: '', code: 'sr'),
    Lang(name: '', code: 'sk'),
    Lang(name: '', code: 'sl'),
    Lang(name: '', code: 'es'),
    Lang(name: '', code: 'sw'),
    Lang(name: '', code: 'sv'),
    Lang(name: '', code: 'th'),
    Lang(name: '', code: 'tr'),
    Lang(name: '', code: 'uk'),
    Lang(name: '', code: 'ur'),
    Lang(name: '', code: 'vi'),
    Lang(name: '', code: 'cy'),
    Lang(name: '', code: 'yi'),
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
                color: Colors.white,
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
  const LangWidget({super.key, required this.name, required this.code});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(name),
    );
  }
}
