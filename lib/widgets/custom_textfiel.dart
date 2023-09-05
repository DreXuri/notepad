import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/sections/homepage/widget/h_soace.dart';
import 'package:noteapp/utils/color_constant.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hasLabel;
  final bool obscureText;
  final bool multiLine;
  final bool enabled;
  final bool readOnly;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool filled;
  final TextAlign textAlign;
  final String? label;
  final Color? fillColor;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  /// A custom TextFormField to accept user input
  const InputWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.keyBoardType,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.hasLabel = true,
    this.obscureText = false,
    this.multiLine = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.inputFormatters,
    this.filled = true,
    this.textAlign = TextAlign.start,
    this.label,
    this.fillColor,
    this.focusNode,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel)
          Text(
            label ?? hintText ?? '',
            style: TextStyle(
                fontSize: 14.sp,
                letterSpacing: -0.02.sp,
                color: kTextGray,
                height: (22 / 14).sp),
          ),
        if (hasLabel) HSpace(hight: 4.h),
        TextFormField(
          autofocus: false,
          focusNode: focusNode,
          initialValue: initialValue,
          readOnly: readOnly,
          enabled: enabled,
          maxLines: multiLine ? null : 1,
          expands: multiLine ? true : false,
          cursorColor: kPrimaryRed,
          textAlignVertical:
              multiLine ? TextAlignVertical.top : TextAlignVertical.center,
          autocorrect: true,
          textAlign: textAlign,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: keyBoardType,
          obscureText: obscureText,
          controller: controller,
          obscuringCharacter: '*',
          inputFormatters: inputFormatters,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(color: kTextBlack),
          ).copyWith(fontSize: 20.0.sp),
          decoration: InputDecoration(
            fillColor: fillColor ?? kLightGray,
            filled: filled,
            isDense: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffix: Padding(
              padding: EdgeInsets.only(top: 0.0.h),
              child: suffix,
            ),

            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(3.0.r)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 16.0.w),
            hintText: !enabled && initialValue != null ? null : hintText,
            hintStyle: GoogleFonts.roboto(
              textStyle: const TextStyle(color: kTextBlack),
            ).copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 20.0.sp,
              height: (20.12 / 14.0).sp,
              color: kTextBlack,
            ),

            errorStyle: GoogleFonts.roboto(
              textStyle: const TextStyle(color: kTextGray),
            ).copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 10.0.sp,
              height: 1,
              color: kPrimaryRed,
            ),
            // labelText: label
            //     ? !enabled && initialValue != null
            //         ? null
            //         : hintText
            //     : null,
            labelStyle: GoogleFonts.roboto(
              textStyle: const TextStyle(color: kTextGray),
            ).copyWith(
              fontWeight: FontWeight.w200,
              fontSize: 14.0.sp,
              height: (22 / 14.0).sp,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.0.r)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.0.r)),
          ),
          onTap: onTap,
          onChanged: (String value) => onChanged?.call(value),
          onFieldSubmitted: (String value) => onFieldSubmitted?.call(value),
          validator: (String? value) => validator?.call(value),
        ),
      ],
    );
  }
}

class MultiLineInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool multiLine;
  final bool enabled;
  final bool readOnly;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool filled;
  final TextAlign textAlign;
  final Color? fillColor;

  /// A custom TextFormField to accept user input
  const MultiLineInputWidget({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
    this.keyBoardType,
    this.obscureText = false,
    this.multiLine = false,
    this.enabled = true,
    this.readOnly = false,
    this.initialValue,
    this.inputFormatters,
    this.filled = true,
    this.textAlign = TextAlign.start,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      mouseCursor: MaterialStateMouseCursor.clickable,
      showCursor: true,
      initialValue: initialValue,
      readOnly: readOnly,
      enabled: enabled,
      maxLines: multiLine ? null : 10,
      expands: multiLine ? true : false,
      cursorColor: kTextGray,
      textAlignVertical:
          multiLine ? TextAlignVertical.top : TextAlignVertical.center,
      autocorrect: true,
      textAlign: textAlign,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      controller: controller,
      obscuringCharacter: '*',
      inputFormatters: inputFormatters,
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(color: kTextGray),
      ).copyWith(fontSize: 16.0.sp),
      decoration: InputDecoration(
        fillColor: fillColor ?? kLightGray,
        filled: filled,
        isDense: true,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(2.0.r)),
        contentPadding:
            EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 16.0.w),
        hintText: !enabled && initialValue != null ? null : hintText,
        hintStyle: GoogleFonts.roboto(
          textStyle: const TextStyle(color: kTextGray),
        ).copyWith(
          fontWeight: FontWeight.w200,
          fontSize: 14.0.sp,
          height: (20.12 / 14.0).sp,
          color: kLightGray,
        ),
        errorStyle: GoogleFonts.roboto(
          textStyle: const TextStyle(color: kTextGray),
        ).copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 10.0.sp,
          height: 1,
          color: kPrimaryRed,
        ),
        labelStyle: GoogleFonts.roboto(
          textStyle: const TextStyle(color: kTextGray),
        ).copyWith(
          fontWeight: FontWeight.w200,
          fontSize: 14.0.sp,
          height: (22 / 14.0).sp,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(2.0.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(2.0.r)),
      ),
      onChanged: (String value) => onChanged?.call(value),
      validator: (String? value) => validator?.call(value),
    );
  }
}
