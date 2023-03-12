import 'package:flutter/material.dart';

class SideMenuItem
extends StatelessWidget
{
  final bool isSelected;
  final Function? onTap;
  final IconData? icon;
  final String? title;
  final List<Widget>? children;
  const SideMenuItem({
    Key? key,
    required this.isSelected,
    this.onTap,
    this.icon,
    this.title,
    this.children = const [],
  })
   : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile( 
      title:Text(title  ?? ""),
    );
  }
}
