import 'package:flutter/material.dart';
import 'package:portfolio_website/constants.dart';
import 'package:flutter/animation.dart';

class Button2 extends StatefulWidget {
  Button2({required this.title, required this.tapEvent, required this.fontSize});

  final String title;
  final GestureTapCallback tapEvent;
  final double fontSize;

  @override
  State<Button2> createState() => _Button2State();
}

class _Button2State extends State<Button2> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (e) {
          setState(() {
            isHovering = !isHovering;
          });
        },
        onExit: (e) {
          setState(() {
            isHovering = !isHovering;
          });
        },
        child: GestureDetector(
          onTap: widget.tapEvent,
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: isHovering ? Colors.black : Colors.transparent,
              border: const Border(
                bottom: BorderSide(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid),
                top: BorderSide(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid),
                left: BorderSide(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid),
                right: BorderSide(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid),
              ),
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'SanFrancisco',
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w700,
                color: isHovering ? Colors.white : Colors.black,
              ),
            ),
          ),
        ));
  }
}
