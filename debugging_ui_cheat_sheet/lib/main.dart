import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  debugPaintBaselinesEnabled = false;
  debugPaintLayerBordersEnabled = false;
  debugPaintPointersEnabled = false;
  debugRepaintRainbowEnabled = false;
  debugRepaintTextRainbowEnabled = false;
  debugCheckElevationsEnabled = false;
  debugDisableClipLayers = false;
  debugDisablePhysicalShapeLayers = false;
  debugDisableOpacityLayers = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body:
          Stack(
            children: <Widget>[
              Positioned(
                top: 50,
                left: 50,
                child: Material(
                  elevation: 17.0,
                  shape: BeveledRectangleBorder(
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(46.0)),
                  ),
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      color: Colors.green,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 16.0,
                shape: BeveledRectangleBorder(
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(46.0)),
                ),
                child: Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: GestureDetector(
                      onTap: () {
                        print("Image Tapped");
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.all(5.0),
                          margin: EdgeInsets.only(top: 20),
                          child: Image.asset("assets/JL-Logo.png"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 300,
                    padding: EdgeInsets.only(top: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.orange,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.yellow,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                width: 200,
                                height: 100,
                                color: Colors.red,
                                child: Text("JLouage"),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    print("Black Box Tapped");
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    color: Colors.black,
                                  )),
                              Container(
                                width: 200,
                                height: 100,
                                color: Colors.green,
                              ),
                              Container(
                                width: 200,
                                height: 100,
                                color: Colors.brown,
                              ),
                              Container(
                                width: 200,
                                height: 100,
                                color: Colors.blue,
                              ),
                              Container(
                                width: 200,
                                height: 100,
                                color: Colors.limeAccent,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.black,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.green,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.brown,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.limeAccent,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.orange,
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}