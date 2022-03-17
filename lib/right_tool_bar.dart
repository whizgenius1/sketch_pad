import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'general_provider.dart';

class RightToolBar extends StatelessWidget {
  const RightToolBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (context, gp, child) {
      return Positioned(
          top: 40.0,
          right: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: gp.clear,
                child: CircleAvatar(
                  child: Icon(
                    Icons.create,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: gp.save,
                child: CircleAvatar(
                  child: Icon(
                    Icons.save,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ColourButton(selectedColor: Colors.red),
              ColourButton(selectedColor: Colors.blueAccent),
              ColourButton(selectedColor: Colors.deepOrange),
              ColourButton(selectedColor: Colors.green),
              ColourButton(selectedColor: Colors.lightBlue),
              ColourButton(selectedColor: Colors.black),
              ColourButton(selectedColor: Colors.orange),
              ColourButton(selectedColor: Colors.white),
            ],
          ));
    });
  }
}

class StrokeButton extends StatelessWidget {
  final double selectedWidth;
  const StrokeButton({Key key, this.selectedWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (context, gp, child) {
      return GestureDetector(
        onTap: () => gp.setSelectedWidth(selectedWidth),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: selectedWidth * 2,
            height: selectedWidth * 2,
            decoration: BoxDecoration(
                color: gp.selectedColour,
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      );
    });
  }
}

class BottomRightBar extends StatelessWidget {
  const BottomRightBar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50.0,
      right: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer<GeneralProvider>(builder: (context, gp, child) {
            return StrokeButton(selectedWidth: gp.selectedWidth);
          }),
          Consumer<GeneralProvider>(builder: (context, gp, child) {
            return DropdownButton(
                items: List.generate(20, (index) => index + 1)
                    .map<DropdownMenuItem<int>>(
                        (int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                    .toList(),
                value: gp.value,
                onChanged: (value) {
                  gp.setValue(value.toDouble());
                  gp.setSelectedWidth(value.toDouble());
                });
          })
        ],
      ),
    );
  }
}

class ColourButton extends StatelessWidget {
  final Color selectedColor;
  const ColourButton({Key key, this.selectedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(builder: (context, gp, child) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          mini: true,
          backgroundColor: selectedColor,
          child: Container(),
          onPressed: () => gp.setSelectedColor(selectedColor),
        ),
      );
    });
  }
}
