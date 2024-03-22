import 'package:flutter/material.dart';

class cameraNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const cameraNavigation({
    required this.currentIndex,
    required this.onTap,
    required this.onNextPressed,
    required this.onPreviousPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0, // Adjust the height as needed
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: onPreviousPressed,
            ),
            //IconButton(
            //icon: Icon(Icons.home),
            //onPressed: () => onTap(0),
            //),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: onNextPressed,
            ),
          ],
        ),
      ),
    );
  }
}
