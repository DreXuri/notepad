import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class vSpace extends StatelessWidget {
  final double? width;
  const vSpace({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 6.w,
    );
  }
}
