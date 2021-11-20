import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const BasicPhrases());
}

class BasicPhrases extends StatelessWidget {
  const BasicPhrases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicPhrasesSts(),
    );
  }
}

class BasicPhrasesSts extends StatefulWidget {
  const BasicPhrasesSts({Key? key}) : super(key: key);

  @override
  _BasicPhrasesStsState createState() => _BasicPhrasesStsState();
}

class _BasicPhrasesStsState extends State<BasicPhrasesSts> {
  final FlutterTts flutterTts = FlutterTts();
  List<Map<String, Object>> myText = <Map<String, Object>>[
    <String, Object>{'id': 0, 'name': 'Salut', 'text': 'Salut'},
    <String, Object>{'id': 1, 'name': 'Salut (Spaniola)', 'text': 'Hola'},
    <String, Object>{'id': 2, 'name': 'Ce faci?', 'text': 'Ce faci?'},
    <String, Object>{'id': 3, 'name': 'Ce faci (Spaniola)', 'text': 'Como estas?'},
    <String, Object>{'id': 4, 'name': 'Unde este metroul', 'text': 'Unde este metroul'},
    <String, Object>{'id': 5, 'name': 'Unde este metroul (Spaniola)', 'text': 'Donde esta el metro?'},
    <String, Object>{'id': 6, 'name': 'La revedere', 'text': 'La revedere'},
    <String, Object>{'id': 7, 'name': 'La revedere (Spaniola)', 'text': 'Hasta la vista beiby'}
  ];

  @override
  Widget build(BuildContext context) {
    Future<void> _speak(String lang, String text) async {
      switch (lang) {
        case 'ro':
          {
            await flutterTts.setLanguage('ro-RO');
            break;
          }
        case 'es':
          {
            await flutterTts.setLanguage('es-ES');
            break;
          }
      }
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Phrases'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemCount: myText.length,
          itemBuilder: (BuildContext ctx, int index) {
            return GestureDetector(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: <Color>[Colors.amber, Colors.amber.shade100]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  myText[index]['name'].toString(),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                index.isEven
                    ? _speak('ro', myText[index]['text'].toString())
                    : _speak('es', myText[index]['text'].toString());
              },
            );
          }),
    );
  }
}
