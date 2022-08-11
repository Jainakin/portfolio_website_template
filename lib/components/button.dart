import 'package:flutter/material.dart';
import 'package:portfolio_website/constants.dart';
import 'package:flutter/animation.dart';

class Button extends StatefulWidget {
  Button({required this.title, required this.tapEvent, required this.fontSize});

  final String title;
  final GestureTapCallback tapEvent;
  final double fontSize;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
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
              color: isHovering ? primaryColor : Colors.transparent,
              border: const Border(
                bottom: BorderSide(
                    color: primaryColor,
                    width: 3.0,
                    style: BorderStyle.solid),
                top: BorderSide(
                    color: primaryColor,
                    width: 3.0,
                    style: BorderStyle.solid),
                left: BorderSide(
                    color: primaryColor,
                    width: 3.0,
                    style: BorderStyle.solid),
                right: BorderSide(
                    color: primaryColor,
                    width: 3.0,
                    style: BorderStyle.solid),
              ),
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'SanFrancisco',
                fontWeight: FontWeight.w700,
                fontSize: widget.fontSize,
                color: isHovering ? Colors.black : primaryColor,
              ),
            ),
          ),
        ));
  }
}
