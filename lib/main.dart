import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double _padding = 16.0;
    final double _buttonFontSize = 24.0;

    final Color _primary = Color(0xFFa99985);
    final Color _btnColor = Color(0xFFf2e9e4);
    final Color _btnColor2 = Color(0xFFc9ada7);
    final Color _btnColor3 = Color(0xFF9a8c98);
    final Color _btnText = Color(0xFF22223b);
    final Color _btnHl = Color(0xFFdad2bc);
    final Color _bgPrimary = Color.fromRGBO(244, 243, 238, 1);
    // final String? history = '';

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    buttonPressed(String buttonText) {
      print(buttonText);
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            title: Center(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            elevation: 0,
            backgroundColor: _btnText,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: _bgPrimary),
                padding: EdgeInsets.all(20),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 80),
                      child: Text(
                        history!,
                        style: TextStyle(color: _btnColor3, fontSize: 30),
                      ),
                    ),
                    Text(
                      text!,
                      style: TextStyle(color: Color(0xFF4a4e69), fontSize: 70),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(color: _bgPrimary),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            buildButton("7", _btnColor, 1),
                            buildButton("8", _btnColor, 1),
                            buildButton("9", _btnColor, 1),
                            buildButton("/", _btnColor2, 1),
                          ])),
                      Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            buildButton("4", _btnColor, 1),
                            buildButton("5", _btnColor, 1),
                            buildButton("6", _btnColor, 1),
                            buildButton("x", _btnColor2, 1),
                          ])),
                      Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            buildButton("1", _btnColor, 1),
                            buildButton("2", _btnColor, 1),
                            buildButton("3", _btnColor, 1),
                            buildButton("-", _btnColor2, 1),
                          ])),
                      Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            buildButton("C", _btnColor2, 1),
                            buildButton("0", _btnColor, 1),
                            buildButton("=", _btnColor3, 1),
                            buildButton("+", _btnColor2, 1),
                          ])),
                    ],
                  ),
                ))
          ],
        ));
  }

  int? first, second;
  String? res, hs, text = "", history = "";
  String? opp = "";
  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      hs = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text!);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int?.parse(text!);
      if (opp == "+") {
        res = (first! + second!).toString();
        hs = "$first $opp $second =";
      }
      if (opp == "-") {
        res = (first! - second!).toString();
        hs = "$first $opp $second =";
      }
      if (opp == "x") {
        res = (first! * second!).toString();
        hs = "$first $opp $second =";
      }
      if (opp == "/") {
        res = (first! ~/ second!).toString();
        hs = "$first $opp $second =";
      }
    } else {
      res = int?.parse(text! + btnText).toString();
      hs = "";
    }
    setState(() {
      text = res;
      history = hs;
    });
  }

  Widget buildButton(String buttonText, Color buttonColor, int flex) {
    final double _padding = 16.0;
    final double _buttonFontSize = 24.0;

    final Color _btnText = Color(0xFF4a4e69);

    return Expanded(
        flex: flex,
        child: Container(
          width: 2,
          margin: EdgeInsets.all(3),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: buttonColor, shape: CircleBorder()),
            child: Text(
              buttonText,
              style: TextStyle(color: _btnText, fontSize: 20),
            ),
            onPressed: () => btnClicked(buttonText),
          ),
        ));
  }
}
