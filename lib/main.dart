// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:dialogue_sarath/map.dart';
import 'package:dialogue_sarath/overlay.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  ScrollController _controller = ScrollController();
  DateTime? isSelected = DateTime.now();

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
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: Colors.transparent,
                          height: 80,
                          child: ListView.builder(
                              controller: _controller,
                              itemCount: 31,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final day =
                                    DateTime.now().add(Duration(days: index));
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = day;
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: isSelected?.day == day.day &&
                                                  isSelected?.month ==
                                                      day.month &&
                                                  isSelected?.year == day.year
                                              ? 50
                                              : 40,
                                          width: isSelected?.day == day.day &&
                                                  isSelected?.month ==
                                                      day.month &&
                                                  isSelected?.year == day.year
                                              ? 50
                                              : 40,
                                          margin: EdgeInsets.all(5.6),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isSelected?.day == day.day &&
                                                    isSelected?.month ==
                                                        day.month &&
                                                    isSelected?.year == day.year
                                                ? Colors.blue
                                                : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: isSelected?.day == day.day &&
                                                isSelected?.month ==
                                                    day.month &&
                                                isSelected?.year == day.year
                                            ? 22
                                            : 27,
                                        left: isSelected?.day == day.day &&
                                                isSelected?.month ==
                                                    day.month &&
                                                isSelected?.year == day.year
                                            ? 20
                                            : 15,
                                        child: Column(
                                          children: [
                                            Text(
                                              day.day.toString(),
                                              style: TextStyle(
                                                color: isSelected?.day ==
                                                            day.day &&
                                                        isSelected?.month ==
                                                            day.month &&
                                                        isSelected?.year ==
                                                            day.year
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: isSelected?.day ==
                                                            day.day &&
                                                        isSelected?.month ==
                                                            day.month &&
                                                        isSelected?.year ==
                                                            day.year
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                fontSize: isSelected?.day ==
                                                            day.day &&
                                                        isSelected?.month ==
                                                            day.month &&
                                                        isSelected?.year ==
                                                            day.year
                                                    ? 18
                                                    : 15,
                                              ),
                                            ),
                                            Text(
                                              DateFormat('EEE')
                                                  .format(day)
                                                  .toUpperCase(),
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
                    ),
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
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return Map_Project();
                    }));
                  },
                  child: Text("Map")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return OverlayContainer();
                    }));
                  },
                  child: Text("tooltip"))
            ],
          ),
        ),
      ),
    );
  }
}
