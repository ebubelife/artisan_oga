import 'package:flutter/material.dart';
import 'package:artisan_oga/core/app_export.dart';
import 'package:artisan_oga/widgets/custom_drop_down.dart';
import 'package:artisan_oga/widgets/custom_elevated_button.dart';
import 'package:artisan_oga/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../j_s_create_account_page_six_screen/j_s_create_account_page_six_screen.dart';

// ignore_for_file: must_be_immutable
class JSCreateAccountPageFiveScreen extends StatefulWidget {
  @override
  _JSCreateAccountPageFiveScreenState createState() =>
      _JSCreateAccountPageFiveScreenState();
}

class _JSCreateAccountPageFiveScreenState
    extends State<JSCreateAccountPageFiveScreen> {
  //
  List<String> dropdownItemList = ["Yes", "No Education"];

  TextEditingController schoolNameController = TextEditingController();

  TextEditingController enterAwardYearController = TextEditingController();

  TextEditingController courseNameController = TextEditingController();

  TextEditingController awardTitleController = TextEditingController();

  String selectedEducationOption = "Yes";

  String selectedDate = "yyyy-MM-dd";

  @override
  void initState() {
    super.initState();
    // Call getCountries when the widget initializes

    schoolNameController.text = "";
    enterAwardYearController.text = "";
    courseNameController.text = "";
    awardTitleController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.h, vertical: 12.v),
                        child: Column(children: [
                          SizedBox(height: 26.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgArrowLeftOnprimary,
                                    height: 16.adaptSize,
                                    width: 16.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 2.v),
                                    onTap: () {
                                      onTapImgArrowLeft(context);
                                    }),
                                GestureDetector(
                                    onTap: (() {
                                      Navigator.pop(context);
                                    }),
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 7.h),
                                        child: Text("Back",
                                            style: CustomTextStyles
                                                .titleMediumOnPrimary)))
                              ])),
                          SizedBox(height: 38.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 3.h),
                                  child: Text(
                                      "Do you have any educational qualifications?",
                                      style: theme.textTheme.bodyMedium))),
                          SizedBox(height: 6.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.h),
                              child: CustomDropDown(
                                  icon: Container(
                                      padding: EdgeInsets.all(3.h),
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 14.v, 20.h, 14.v),
                                      decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          borderRadius:
                                              BorderRadius.circular(9.h)),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgCheckmark,
                                          height: 11.adaptSize,
                                          width: 11.adaptSize)),
                                  hintText:
                                      "Do you have any educational qualification?",
                                  items: dropdownItemList,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedEducationOption = value;
                                    });
                                  })),
                          SizedBox(height: 28.v),
                          selectedEducationOption == "Yes"
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 3.h),
                                      child: Text("School Name",
                                          style: theme.textTheme.bodyMedium)))
                              : SizedBox(),
                          SizedBox(height: 6.v),
                          selectedEducationOption == "Yes"
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: CustomTextFormField(
                                      controller: schoolNameController,
                                      hintText: "Enter School Name",
                                      hintStyle: theme.textTheme.titleSmall!))
                              : SizedBox(),
                          SizedBox(height: 27.v),
                          selectedEducationOption == "Yes"
                              ? Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 3.h),
                                      child: Text("Course Name",
                                          style: theme.textTheme.bodyMedium)))
                              : SizedBox(),
                          SizedBox(height: 7.v),
                          selectedEducationOption == "Yes"
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.h),
                                  child: CustomTextFormField(
                                      controller: courseNameController,
                                      hintText: "Enter Course Name",
                                      hintStyle: theme.textTheme.titleSmall!,
                                      textInputAction: TextInputAction.done))
                              : SizedBox(),
                          /*

 SizedBox(height: 27.v),
                          Text(
                            "Do you have any relevant awards?",
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 27.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 3.h),
                                  child: Text("Award Title",
                                      style: theme.textTheme.bodyMedium))),
                          SizedBox(height: 7.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.h),
                              child: CustomTextFormField(
                                  controller: awardTitleController,
                                  hintText: "Enter Award title",
                                  hintStyle: theme.textTheme.titleSmall!,
                                  textInputAction: TextInputAction.done)),
                          SizedBox(height: 27.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 3.h),
                                  child: Text("Award Year",
                                      style: theme.textTheme.bodyMedium))),
                          SizedBox(height: 7.v),
                          Container(
                              width: double.maxFinite,
                              child: GestureDetector(
                                  onTap: (() {
                                    _showDatePickerBottomSheet(context);
                                  }),
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 10.h),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 180.h,
                                              child: Text(selectedDate),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(6)),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255, 220, 219, 219))),
                                            )
                                          ])))),

                         */
                          SizedBox(height: 54.v),
                          CustomElevatedButton(
                              onPressed: (() {
                                //retrieve data from hive store
                                var newUserData =
                                    Hive.box("artisan").get("new_applicant");

                                //update the array of maps
                                //push each item from the form to the array

                                newUserData.add({
                                  "educational_qualification":
                                      selectedEducationOption
                                });

                                newUserData.add(
                                    {"school_name": schoolNameController.text});

                                newUserData.add(
                                    {"course_name": courseNameController.text});

                                newUserData.add(
                                    {"award_title": awardTitleController.text});

                                newUserData.add({
                                  "award_year": enterAwardYearController.text
                                });

                                //re-save the updated array

                                Hive.box("artisan")
                                    .put("new_applicant", newUserData);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          JSCreateAccountPageSixScreen()),
                                );
                              }),
                              text: "Next",
                              margin: EdgeInsets.symmetric(horizontal: 3.h)),
                        ]))))));
  }

  void _showDatePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(top: 10),
          height: 400, // Adjust the height as needed
          child: Column(
            children: [
              SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.single,
              ),
              Container(
                  width: double.maxFinite,
                  child: Center(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              backgroundColor: Color.fromARGB(255, 0, 0,
                                  0), // Change this to your desired color
                            ),
                            child: Text(
                              'Close',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              backgroundColor: Color.fromARGB(255, 204, 82,
                                  0), // Change this to your desired color
                            ),
                            child: Text(
                              'Submit',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ]),
                  ))
            ],
          ),
        );
      },
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    final pickedDate = DateFormat('yyyy-MM-dd').format(args.value);

    setState(() {
      selectedDate = pickedDate;
    });

    print(args.value);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
