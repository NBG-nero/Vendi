import 'package:flutter/material.dart';

import 'package:vendi/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  final bool isSelected;

  const SideMenu({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child:Column( 

        children: [ 
          SideMenuItem( 
            isSelected: isSelected,
          ),
        ],
      )
    );
  }
}
