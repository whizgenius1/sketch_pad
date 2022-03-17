import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'drawn_line.dart';

class GeneralProvider extends ChangeNotifier {
  List<DrawnLine> _lines = <DrawnLine>[];
  DrawnLine _line;
  Color _selectedColour = Colors.black;
  double _selectedWidth = 5.0;

  double _value = 1;

  double get value => _value;

  setValue(double value) {
    _value = value;
    notifyListeners();
  }

  StreamController<DrawnLine> _currentLineStreamController =
      StreamController<DrawnLine>.broadcast();

  StreamController<List<DrawnLine>> _linesStreamController =
      StreamController<List<DrawnLine>>.broadcast();

  GlobalKey _globalKey = new GlobalKey();

  List<DrawnLine> get lines => _lines;
  DrawnLine get line => _line;
  Color get selectedColour => _selectedColour;
  double get selectedWidth => _selectedWidth;

  StreamController<DrawnLine> get currentLineStreamController =>
      _currentLineStreamController;
  StreamController<List<DrawnLine>> get linesStreamController =>
      _linesStreamController;

  GlobalKey get globalKey => _globalKey;

  setCurrentLineStreamController({DrawnLine line}) {
    _currentLineStreamController.add(line);
    notifyListeners();
  }

  setLinesStreamController({List<DrawnLine> lines}) {
    _linesStreamController.add(lines);
    notifyListeners();
  }

  setLine({DrawnLine line}) {
    _line = line;
    notifyListeners();
  }

  setLines({List<DrawnLine> lines}) {
    _lines = lines;
    notifyListeners();
  }

  setSelectedColor(Color selectedColor) {
    _selectedColour = selectedColor;
    notifyListeners();
  }

  setSelectedWidth(double selectedWidth) {
    _selectedWidth = selectedWidth;
    notifyListeners();
  }

  Future<void> save() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      var saved = await ImageGallerySaver.saveImage(
        pngBytes,
        quality: 100,
        name: DateTime.now().toIso8601String() + ".png",
        isReturnImagePathOfIOS: true,
      );
      print(saved);
    } catch (e) {
      print(e);
    }
  }

  clear() {
    _lines = [];
    _line = null;
    notifyListeners();
  }
}
