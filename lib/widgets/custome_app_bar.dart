import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:noteapp/widgets/custome_text.dart';

PreferredSizeWidget customAppBar(
  BuildContext context, {
  String titleText = '',
  Widget? title,
  double elevation = 0,
  double? fontSize,
  double? titleSpacing,
  bool automaticallyImplyLeading = true,
  Widget? leading,
  Color? backgroundColor,
  IconThemeData? iconThemeData,
  TabBar? bottom,
  List<Widget>? action,
  bool hasLeading = true,
  VoidCallback? onBackTap,
  double preferredSize = 55.0,
  bool centerTitle = true,
  Color? titleColor,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return AppBar(
    centerTitle: centerTitle,
    leading: !hasLeading
        ? null
        : InkWell(
            onTap: onBackTap ??
                () {
                  Navigator.pop(
                    context,
                  );
                },
            child: leading ??
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: kBlack,
                      size: 25,
                    ),
                    // child: SvgPicture.asset(
                    //   Assets.backArrowIcon,
                    //   width: 7.7.w,
                    //   height: 13.h,
                    //   color: kBlack,
                    // ),
                  ),
                ),
          ),
    automaticallyImplyLeading: automaticallyImplyLeading,
    backgroundColor: backgroundColor ?? Colors.transparent,
    elevation: elevation,
    titleSpacing: titleSpacing,
    bottom: bottom,
    iconTheme: iconThemeData,
    actions: action,
    title: Padding(
      padding: EdgeInsets.only(top: 5.0.h),
      child: title ??
          CustomText(
            data: titleText,
            overflow: TextOverflow.fade,
            fontSize: fontSize ?? 20.0.sp,
            color: titleColor ?? kBlack,
            fontWeight: fontWeight,
            textAlign: TextAlign.center,
          ),
    ),
  );
}
