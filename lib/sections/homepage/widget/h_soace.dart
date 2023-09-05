import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSpace extends StatelessWidget {
  final double? hight;
  const HSpace({
    super.key,
    this.hight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 6.h,
    );
  }
}
