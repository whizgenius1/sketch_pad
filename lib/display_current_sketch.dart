import 'package:sketch_pad/general_provider.dart';
import 'package:sketch_pad/sketcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawn_line.dart';

class DisplayCurrentSketch extends StatelessWidget {
  const DisplayCurrentSketch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GeneralProvider gb = Provider.of<GeneralProvider>(context, listen: false);

    void onPanStart(DragStartDetails details) {
      RenderBox box = context.findRenderObject();
      Offset point = box.globalToLocal(details.globalPosition);
      gb.setLine(line: DrawnLine([point], gb.selectedColour, gb.selectedWidth));
      //line = DrawnLine([point], gb.selectedColour, gb.selectedWidth);
    }

    void onPanUpdate(DragUpdateDetails details) {
      RenderBox box = context.findRenderObject();
      Offset point = box.globalToLocal(details.globalPosition);

      List<Offset> path = List.from(gb.line.path)..add(point);
      gb.setLine(line: DrawnLine(path, gb.selectedColour, gb.selectedWidth));

      //  line = DrawnLine(path, selectedColor, selectedWidth);
      gb.setCurrentLineStreamController(line: gb.line);
      // currentLineStreamController.add(line);
    }

    void onPanEnd(DragEndDetails details) {
      //  lines = List.from(lines)..add(line);
      gb.setLines(lines: List.from(gb.lines)..add(gb.line));

      //  linesStreamController.add(lines);

      gb.setLinesStreamController(lines: gb.lines);
    }

    return Consumer<GeneralProvider>(builder: (context, gp, child) {
      return GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: RepaintBoundary(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(4.0),
            color: Colors.transparent,
            alignment: Alignment.topLeft,
            child: StreamBuilder<DrawnLine>(
              stream: gp.currentLineStreamController.stream,
              builder: (context, snapshot) {
                return CustomPaint(
                  painter: Sketcher(lines: [gp.line], strokeWidth: 1),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
