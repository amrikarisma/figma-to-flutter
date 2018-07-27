import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'widgets/sample.g.dart';

void main() => runApp(new MyApp());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _i = 0;
  CustomPainter painter;

  CustomPainter _createPainter() {
    _i++;
    switch(_i) {
      case 1: return LandscapeEffectsPainter(LandscapeEffectsText(
          sUUN: "TEST"
      ));
      case 2: return ConstraintsNestedPainter();
      case 3: return Fill1Painter();
      case 4: return Text1Painter(Text1Text());
      case 5: return Text2Painter(Text2Text());
      case 6: return Text3Painter(Text3Text());
      case 7: return Text4Painter(Text4Text());
      default:
        _i  = 0;
        return _createPainter();
    }
  }

  @override
    void initState() {
      super.initState();
      painter = _createPainter();
    }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Container(
            constraints: BoxConstraints.expand(),  
            child: CustomPaint(
              painter: painter,
            ),
      ),
          floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.skip_next),
            onPressed: (){
              this.setState((){
                painter = _createPainter();
              });
            }
          ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
    );
  }
}