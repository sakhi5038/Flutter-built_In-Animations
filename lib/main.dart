import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final tween = Tween<double>(begin: 0, end: 2 * pi);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: _animationController,
                child: Container(
                  alignment: const Alignment(200, 400),
                  height: 200,
                  width: 200,
                  color: Colors.blueGrey,
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.amber,
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                _animationController.forward();
              },
              tooltip: 'Forward',
              child: const Icon(Icons.forward),
            ),
            FloatingActionButton(
              onPressed: () {
                _animationController.reverse();
              },
              tooltip: 'Reverse',
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              onPressed: () {
                _animationController.repeat();
              },
              tooltip: 'Repeat',
              child: const Icon(Icons.repeat),
            ),
            FloatingActionButton(
              onPressed: () {
                _animationController.stop();
              },
              tooltip: 'Stop',
              child: const Icon(Icons.stop),
            )
          ],
        ));
  }
}
