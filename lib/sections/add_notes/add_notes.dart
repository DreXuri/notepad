import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/sections/homepage/widget/app_drawer.dart';
import 'package:noteapp/sections/homepage/widget/h_soace.dart';
import 'package:noteapp/sections/homepage/widget/row_list.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:noteapp/widgets/custom_textfiel.dart';
import 'package:noteapp/widgets/custome_app_bar.dart';
import 'package:noteapp/widgets/custome_text.dart';

class AddNotes extends ConsumerStatefulWidget {
  static const route = '/add_notes';
  const AddNotes({
    super.key,
  });

  @override
  ConsumerState<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends ConsumerState<AddNotes> {
  final titleController = TextEditingController();
  final desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      appBar: customAppBar(
        context,
        hasLeading: true,
        titleText: 'ADD Notes',
        action: [
          Padding(
            padding: EdgeInsets.only(right: 20.0.w),
            child: const Icon(
              Icons.directions_car_filled_rounded,
              color: kBlack,
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
        child: Form(
          child: Column(
            children: [
              InputWidget(
                hintText: 'Enter notes title',
                controller: titleController,
                filled: true,
              ),
              const HSpace(),
              // MultiLineInputWidget(
              //   hintText: 'Enter notes',
              //   controller: desController,
              //   filled: true,
              // ),

              const HSpace(),
              Container(
                height: 255.h,
                width: 350.w,
                decoration: const BoxDecoration(color: kLightGray),
                child: PopupMenuButton(
                  position: PopupMenuPosition.under,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: RowList(
                        onTap: () {},
                        icon: Icons.folder_zip_sharp,
                        text: 'Save',
                      ),
                    ),
                    PopupMenuItem(
                      child: RowList(
                        onTap: () {},
                        icon: Icons.push_pin,
                        text: 'Pin Notes',
                      ),
                    ),
                  ],
                  child: CustomText(
                      color: kTextGray,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      data:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.start),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
