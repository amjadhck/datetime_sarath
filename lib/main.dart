// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _controller = ScrollController();
  int? isSelected;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  final itemSize = 100.0;
  _moveBack() {
    _controller.animateTo(_controller.offset - itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveForward() {
    _controller.animateTo(_controller.offset + itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _moveBack,
                      child: Stack(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            alignment: Alignment.center,
                          ),
                          Positioned(
                            left: 6,
                            top: 4,
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color: Colors.transparent,
                        height: 80,
                        width: 360,
                        child: ListView.builder(
                            controller: _controller,
                            itemCount: 30,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelected = index;
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: isSelected == index ? 50 : 40,
                                        width: isSelected == index ? 50 : 40,
                                        margin: EdgeInsets.all(5.6),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected == index
                                              ? Colors.blue
                                              : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: isSelected == index ? 22 : 27,
                                      left: isSelected == index ? 20 : 15,
                                      child: Column(
                                        children: [
                                          Text(
                                            index.toString(),
                                            style: TextStyle(
                                              color: isSelected == index
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: isSelected == index
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              fontSize:
                                                  isSelected == index ? 18 : 15,
                                            ),
                                          ),
                                          Text(
                                            "MON",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })),
                    GestureDetector(
                      onTap: _moveForward,
                      child: Stack(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle
                                //borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                            alignment: Alignment.center,
                          ),
                          Positioned(
                            left: 4,
                            top: 4,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Selected : $isSelected"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
