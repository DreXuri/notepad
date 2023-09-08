import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/sections/homepage/widget/v_space.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:noteapp/widgets/custome_text.dart';

class RowList extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const RowList({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          vSpace(width: 4.w),
          CustomText(
            data: text,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: kTextBlack,
          ),
        ],
      ),
    );
  }
}
