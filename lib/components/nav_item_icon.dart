import 'package:flutter/material.dart';
import 'package:portfolio_website/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class NavItemIcon extends StatefulWidget {
  NavItemIcon({required this.icon, required this.tapEvent});

  final GestureTapCallback tapEvent;
  final IconData icon;

  @override
  State<NavItemIcon> createState() => _NavItemIconState();
}

class _NavItemIconState extends State<NavItemIcon> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: MouseRegion(
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
          child: Icon(
            widget.icon,
            color: isHovering ? primaryColor : Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
