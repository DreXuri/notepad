import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/sections/homepage/widget/h_soace.dart';
import 'package:noteapp/sections/homepage/widget/row_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
          top: 200.h,
          left: 50.w,
        ),
        child: const Column(
          children: [
            RowList(
              icon: Icons.note,
              text: 'All Notes',
            ),
            HSpace(
              hight: 12,
            ),
            RowList(
              icon: Icons.description,
              text: 'Notebook',
            ),
            HSpace(
              hight: 12,
            ),
            RowList(
              icon: Icons.favorite,
              text: 'Favorite',
            ),
            HSpace(
              hight: 12,
            ),
            RowList(
              icon: Icons.delete,
              text: 'Deleted',
            ),
            HSpace(
              hight: 12,
            ),
            RowList(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
