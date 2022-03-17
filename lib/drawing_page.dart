import 'package:sketch_pad/right_tool_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'display_all_sketch.dart';
import 'display_current_sketch.dart';
import 'general_provider.dart';

class DrawingPage extends StatelessWidget {
  const DrawingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FC),
      body: Consumer<GeneralProvider>(builder: (context, gp, child) {
        return Stack(
          children: [
            DisplayAllSketch(),
            // buildAllPaths(context),

            ///
            DisplayCurrentSketch(),
            // buildCurrentPath(context),

            ///
            BottomRightBar(),
            // buildStrokeToolbar(),

            ///
            RightToolBar()
            // buildColorToolbar(),
          ],
        );
      }),
    );
  }
}

// class DrawingPage extends StatefulWidget {
//   @override
//   _DrawingPageState createState() => _DrawingPageState();
// }
//
// class _DrawingPageState extends State<DrawingPage> {
//   // GlobalKey _globalKey = new GlobalKey();
//   // List<DrawnLine> lines = <DrawnLine>[];
//   // DrawnLine line;
//   // Color selectedColor = Colors.black;
//   // double selectedWidth = 5.0;
//   //
//   // StreamController<List<DrawnLine>> linesStreamController =
//   //     StreamController<List<DrawnLine>>.broadcast();
//   // StreamController<DrawnLine> currentLineStreamController =
//   //     StreamController<DrawnLine>.broadcast();
//   //
//   // Future<void> save() async {
//   //   try {
//   //     RenderRepaintBoundary boundary =
//   //         _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
//   //     ui.Image image = await boundary.toImage();
//   //     ByteData byteData =
//   //         await image.toByteData(format: ui.ImageByteFormat.png);
//   //     Uint8List pngBytes = byteData.buffer.asUint8List();
//   //     var saved = await ImageGallerySaver.saveImage(
//   //       pngBytes,
//   //       quality: 100,
//   //       name: DateTime.now().toIso8601String() + ".png",
//   //       isReturnImagePathOfIOS: true,
//   //     );
//   //     print(saved);
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
//   //
//   // Future<void> clear() async {
//   //   setState(() {
//   //     lines = [];
//   //     line = null;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF4F7FC),
//       body: Consumer<GeneralProvider>(builder: (context, gp, child) {
//         return Stack(
//           children: [
//             DisplayAllSketch(),
//             // buildAllPaths(context),
//
//             ///
//             DisplayCurrentSketch(),
//             // buildCurrentPath(context),
//
//             ///
//             BottomRightBar(),
//             // buildStrokeToolbar(),
//
//             ///
//             RightToolBar()
//             // buildColorToolbar(),
//           ],
//         );
//       }),
//     );
//   }
//
//   // ///display current drawn sketch
//   // Widget buildCurrentPath(BuildContext context) {
//   //   return GestureDetector(
//   //     onPanStart: onPanStart,
//   //     onPanUpdate: onPanUpdate,
//   //     onPanEnd: onPanEnd,
//   //     child: RepaintBoundary(
//   //       child: Container(
//   //         width: MediaQuery.of(context).size.width,
//   //         height: MediaQuery.of(context).size.height,
//   //         padding: EdgeInsets.all(4.0),
//   //         color: Colors.transparent,
//   //         alignment: Alignment.topLeft,
//   //         child: StreamBuilder<DrawnLine>(
//   //           stream: currentLineStreamController.stream,
//   //           builder: (context, snapshot) {
//   //             return CustomPaint(
//   //               painter: Sketcher(lines: [line], strokeWidth: 1),
//   //             );
//   //           },
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   //
//   // ///display all sketches
//   // Widget buildAllPaths(BuildContext context) {
//   //   return RepaintBoundary(
//   //     key: _globalKey,
//   //     child: Container(
//   //       width: MediaQuery.of(context).size.width,
//   //       height: MediaQuery.of(context).size.height,
//   //       color: Colors.transparent,
//   //       padding: EdgeInsets.all(4.0),
//   //       alignment: Alignment.topLeft,
//   //       child: StreamBuilder<List<DrawnLine>>(
//   //         stream: linesStreamController.stream,
//   //         builder: (context, snapshot) {
//   //           return CustomPaint(
//   //             painter: Sketcher(lines: lines, strokeWidth: 1),
//   //           );
//   //         },
//   //       ),
//   //     ),
//   //   );
//   // }
//   //
//   // void onPanStart(DragStartDetails details) {
//   //   RenderBox box = context.findRenderObject();
//   //   Offset point = box.globalToLocal(details.globalPosition);
//   //   line = DrawnLine([point], selectedColor, selectedWidth);
//   // }
//   //
//   // void onPanUpdate(DragUpdateDetails details) {
//   //   RenderBox box = context.findRenderObject();
//   //   Offset point = box.globalToLocal(details.globalPosition);
//   //
//   //   List<Offset> path = List.from(line.path)..add(point);
//   //   line = DrawnLine(path, selectedColor, selectedWidth);
//   //   currentLineStreamController.add(line);
//   // }
//   //
//   // void onPanEnd(DragEndDetails details) {
//   //   lines = List.from(lines)..add(line);
//   //
//   //   linesStreamController.add(lines);
//   // }
//   //
//   // ///shows at the bottom right
//   // Widget buildStrokeToolbar() {
//   //   return Positioned(
//   //     bottom: 100.0,
//   //     right: 10.0,
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.center,
//   //       mainAxisAlignment: MainAxisAlignment.start,
//   //       children: [
//   //         buildStrokeButton(5.0),
//   //         buildStrokeButton(10.0),
//   //         buildStrokeButton(15.0),
//   //       ],
//   //     ),
//   //   );
//   // }
//   //
//   // ///shows at the bottom right inside the circle
//   // Widget buildStrokeButton(double strokeWidth) {
//   //   return GestureDetector(
//   //     onTap: () {
//   //       setState(() {
//   //         selectedWidth = strokeWidth;
//   //       });
//   //     },
//   //     child: Padding(
//   //       padding: const EdgeInsets.all(4.0),
//   //       child: Container(
//   //         width: strokeWidth * 2,
//   //         height: strokeWidth * 2,
//   //         decoration: BoxDecoration(
//   //             color: selectedColor, borderRadius: BorderRadius.circular(50.0)),
//   //       ),
//   //     ),
//   //   );
//   // }
//   //
//   // ///left color toolbar
//   // Widget buildColorToolbar() {
//   //   return Positioned(
//   //     top: 40.0,
//   //     right: 10.0,
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.center,
//   //       mainAxisAlignment: MainAxisAlignment.start,
//   //       children: [
//   //         buildClearButton(),
//   //         Divider(
//   //           height: 10.0,
//   //         ),
//   //         buildSaveButton(),
//   //         Divider(
//   //           height: 20.0,
//   //         ), buildColorButton(Colors.red),
//   //         buildColorButton(Colors.blueAccent),
//   //         buildColorButton(Colors.deepOrange),
//   //         buildColorButton(Colors.green),
//   //         buildColorButton(Colors.lightBlue),
//   //         buildColorButton(Colors.black),
//   //         buildColorButton(Colors.orange),
//   //         buildColorButton(Colors.white),
//   //
//   //       ],
//   //     ),
//   //   );
//   // }
//   //
//   // ///inside circle
//   // Widget buildColorButton(Color color) {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(4.0),
//   //     child: FloatingActionButton(
//   //       mini: true,
//   //       backgroundColor: color,
//   //       child: Container(),
//   //       onPressed: () {
//   //         setState(() {
//   //           selectedColor = color;
//   //         });
//   //       },
//   //     ),
//   //   );
//   // }
//   //
//   // Widget buildSaveButton() {
//   //   return GestureDetector(
//   //     onTap: save,
//   //     child: CircleAvatar(
//   //       child: Icon(
//   //         Icons.save,
//   //         size: 20.0,
//   //         color: Colors.white,
//   //       ),
//   //     ),
//   //   );
//   // }
//   //
//   // Widget buildClearButton() {
//   //   return GestureDetector(
//   //     onTap: clear,
//   //     child: CircleAvatar(
//   //       child: Icon(
//   //         Icons.create,
//   //         size: 20.0,
//   //         color: Colors.white,
//   //       ),
//   //     ),
//   //   );
//   // }
// }
