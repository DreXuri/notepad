import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/sections/homepage/widget/v_space.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:noteapp/widgets/custome_text.dart';

class Header extends StatelessWidget {
  final String text;
  const Header({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          CustomText(
            data: text,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: kTextBlack,
          ),
          const vSpace(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                color: kBlack,
                thickness: 1.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
