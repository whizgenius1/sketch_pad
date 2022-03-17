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

            ///
            DisplayCurrentSketch(),

            ///
            BottomRightBar(),

            ///
            RightToolBar()
          ],
        );
      }),
    );
  }
}


