import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/sections/add_notes/add_notes.dart';
import 'package:noteapp/sections/homepage/data_model.dart';
import 'package:noteapp/sections/homepage/widget/app_drawer.dart';
import 'package:noteapp/sections/homepage/widget/h_soace.dart';
import 'package:noteapp/sections/homepage/widget/header.dart';
import 'package:noteapp/sections/homepage/widget/row_list.dart';

import 'package:noteapp/utils/color_constant.dart';
import 'package:noteapp/widgets/custome_app_bar.dart';
import 'package:noteapp/widgets/custome_text.dart';

class Homepage extends StatelessWidget {
  static const route = '/home';
  const Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      appBar: customAppBar(
        context,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: kBlack,
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        titleText: 'All Notes',
        action: [
          Padding(
            padding: EdgeInsets.only(right: 20.0.w),
            child: const Icon(
              Icons.search,
              color: kBlack,
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
        child: Column(
          children: [
            const Header(
              text: 'PINNED NOTES',
            ),
            // Drawer(),
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                  // TODO make this list dynamic
                  itemCount: noteModel().length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.w, horizontal: 15.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    data: noteModel()[index].title,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: kTextBlack,
                                  ),
                                  PopupMenuButton(
                                    child: const Icon(Icons.more_horiz),
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        child: RowList(
                                          icon: Icons.favorite,
                                          text: 'Favourite',
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        child: RowList(
                                          icon: Icons.delete,
                                          text: 'Delete',
                                        ),
                                      ),
                                    ],
                                  ),
                               
                                ],
                              ),
                              const HSpace(),
                              CustomText(
                                data: noteModel()[index].description,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                color: kTextBlack,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      data:
                                          '${date.toString().substring(10, 16)} | ',
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: kTextBlack,
                                    ),
                                    CustomText(
                                      data: date.toString().substring(0, 10),
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: kTextBlack,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            const Header(
              text: 'OTHER NOTES',
            ),

            SizedBox(
              height: 250.h,
              child: ListView.builder(
                  // TODO make this list dynamic
                  itemCount: noteModel().length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.w, horizontal: 15.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    data: noteModel()[index].title,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: kTextBlack,
                                  ),
                                  PopupMenuButton(
                                    child: const Icon(Icons.more_horiz),
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        child: RowList(
                                          icon: Icons.favorite,
                                          text: 'Favourite',
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        child: RowList(
                                          icon: Icons.delete,
                                          text: 'Delete',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const HSpace(),
                              CustomText(
                                data: noteModel()[index].description,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                color: kTextBlack,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  children: [
                                    CustomText(
                                      data: date.toString().substring(10, 16),
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: kTextBlack,
                                    ),
                                    Divider(
                                      height: 10.h,
                                      thickness: 2.w,
                                      color: kBlack,
                                    ),
                                    CustomText(
                                      data: noteModel()[index].title,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: kTextBlack,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlack,
        onPressed: () {
          Navigator.of(context).pushNamed(AddNotes.route);
        },
        child: const Icon(
          Icons.add,
          color: kWhite,
        ),
      ),
    );
  }

  List<NoteModel> noteModel() {
    return [
      NoteModel(
          id: 1,
          title: 'Todo',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
      NoteModel(
          id: 1,
          title: 'Datle',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
      NoteModel(
          id: 1,
          title: 'Datle',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
      NoteModel(
          id: 1,
          title: 'Datle',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
      NoteModel(
          id: 1,
          title: 'Datle',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
    ];
  }
}
