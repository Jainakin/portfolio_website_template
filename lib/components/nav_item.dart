import 'package:flutter/material.dart';
import 'package:portfolio_website/constants.dart';
import 'package:flutter/animation.dart';
import 'package:portfolio_website/responsive.dart';

class NavItem extends StatefulWidget {
  NavItem(
      {required this.title, required this.tapEvent, required this.fontSize});

  final String title;
  final GestureTapCallback tapEvent;
  final double fontSize;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin {
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
        child: Container(
          height: widget.fontSize,
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            style:TextStyle(
              fontFamily: 'SanFrancisco',
              fontWeight: isMobile(context) ? FontWeight.w700 : FontWeight.w400,
              fontSize: widget.fontSize,
              color: isHovering ? primaryColor : Colors.white,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
