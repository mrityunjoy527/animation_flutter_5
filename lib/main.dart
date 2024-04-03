import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _zoomedIn = false;
  var _zoomText = 'Zoom In';
  var _width = 100.0;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  width: _width,
                  curve: _curve,
                  duration: const Duration(milliseconds: 370),
                  child: Image.asset(
                    "assets/images/photo.jpeg",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _zoomedIn = !_zoomedIn;
                      _zoomText = _zoomedIn ? "Zoom Out" : "Zoom In";
                      _width =
                          _zoomedIn ? MediaQuery.of(context).size.width : 100.0;
                      _curve = _zoomedIn? Curves.fastOutSlowIn: Curves.easeIn;
                    });
                  },
                  child: Text(
                    _zoomText,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
