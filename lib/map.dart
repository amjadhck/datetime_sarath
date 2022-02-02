import 'package:flutter/material.dart';

class Map_Project extends StatelessWidget {
  const Map_Project({Key? key}) : super(key: key);

  final map_image = "https://cdn.filestackcontent.com/qfzkumr0RE27pdC8tqeH";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            SizedBox.expand(
              child: Image(
                image: NetworkImage(map_image),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox.expand(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(.7),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue)),
                      child: const Center(
                        child: Text(
                          'Go Offline',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                            title: Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          SizedBox(),
                                          Icon(
                                            Icons.notifications,
                                            color: Colors.blue,
                                            size: 32,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'NEW ORDER',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      '9:45am',
                                      // style: TextStyle(
                                      //     fontSize: 20,
                                      //     fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'BAKE HOUSE',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.location_on,
                                          size: 17,
                                        ),
                                        Text('kochi-Edapally'),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Accept the order'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
