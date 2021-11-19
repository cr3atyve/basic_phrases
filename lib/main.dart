import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: const Text('Basic Phrases'),
        ),
        body: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final FlutterTts flutterTts = FlutterTts();

  final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.amber,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );

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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('ro', 'Salut');
                },
                child: const Text('Salut'),
                style: _buttonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('es', 'Hola');
                },
                child: const Text('Salut (Spaniola)'),
                style: _buttonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('ro', 'Ce faci?');
                },
                child: const Text('Ce faci?'),
                style: _buttonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('es', 'Que tal?');
                },
                child: const Text('Ce faci? (Spaniola)'),
                style: _buttonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('ro', 'Unde este metroul?');
                },
                child: const Text('Unde este metroul?'),
                style: _buttonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('es', 'Dónde está el metro?');
                },
                child: const Text('Unde este metroul? (Spaniola)'),
                style: _buttonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('ro', 'La revedere!');
                },
                child: const Text('La revedere!'),
                style: _buttonStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  _speak('es', 'Hasta luego!');
                },
                child: const Text('La revedere! (Spaniola)'),
                style: _buttonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
