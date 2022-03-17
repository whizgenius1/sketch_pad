import 'package:sketch_pad/drawn_line.dart';
import 'package:sketch_pad/sketcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'general_provider.dart';

class DisplayAllSketch extends StatelessWidget {
  const DisplayAllSketch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (context, gp, child) {
      return RepaintBoundary(
        key: gp.globalKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
          padding: const EdgeInsets.all(4),
          alignment: Alignment.topLeft,
          child: StreamBuilder<List<DrawnLine>>(
            stream: gp.linesStreamController.stream,
            builder: (_, snapshot) => CustomPaint(
              painter: Sketcher(lines: gp.lines, strokeWidth: 1),
            ),
          ),
        ),
      );
    });
  }
}
