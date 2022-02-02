// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class OverlayContainer extends StatefulWidget {
  const OverlayContainer({Key? key}) : super(key: key);

  @override
  State<OverlayContainer> createState() => _OverlayContainerState();
}

class _OverlayContainerState extends State<OverlayContainer> {
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;
  bool _isVisible = false;

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 150,
        child: Container(
          height: 240,
          width: 450,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFFBABABA),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                top: 7,
                right: 30,
                child: GestureDetector(
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  onTap: () {
                    hideHelp();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showHelp() async {
    if (!_isVisible) {
      _overlayState = Overlay.of(context);
      _overlayEntry = _createOverlayEntry();
      _overlayState?.insert(_overlayEntry!);
      _isVisible = true;
    }
  }

  void hideHelp() {
    _isVisible = false;
    _overlayEntry?.remove();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overlay"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //showOverlayContainer(context);
            showHelp();
          },
          child: const Text("Show"),
        ),
      ),
    );
  }
}











// showOverlayContainer(BuildContext context) async {
//     OverlayState? overlayState = Overlay.of(context);
//     OverlayEntry overlayEntry;
//     overlayEntry = OverlayEntry(builder: (context) {
//       return Positioned(
//         top: 100,
//         right: 50,
//         child: Container(
//           height: 200,
//           width: 200,
//           color: Colors.amber,
//           child: ElevatedButton(
//             onPressed: () {
              
//             },
//             child: Text("close"),
//           ),
//         ),
//       );
//     });
//     overlayState?.insert(overlayEntry);
//     // await Future.delayed(const Duration(seconds: 5));
//     // overlayEntry.remove();
//   }