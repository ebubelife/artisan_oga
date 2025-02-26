import 'dart:io';

import 'package:artisan_oga/services/auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:artisan_oga/core/app_export.dart';
import 'package:artisan_oga/widgets/app_bar/appbar_leading_image.dart';
import 'package:artisan_oga/widgets/app_bar/appbar_title.dart';
import 'package:artisan_oga/widgets/app_bar/custom_app_bar.dart';
import 'package:artisan_oga/widgets/custom_drop_down.dart';
import 'package:artisan_oga/widgets/custom_elevated_button.dart';
import 'package:artisan_oga/widgets/custom_text_form_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/default.dart';
import '../js_account_create_success/js_account_create_success.dart';

// ignore_for_file: must_be_immutable
class EmployerSignuppageOneScreen extends StatefulWidget {
  @override
  _EmployerSignuppageOneScreenState createState() =>
      _EmployerSignuppageOneScreenState();
}

class _EmployerSignuppageOneScreenState
    extends State<EmployerSignuppageOneScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController officeTitleController = TextEditingController();

  TextEditingController companyController = TextEditingController();

  List<String> dropdownItemList1 = [
    "O'Level",
    "BSC",
    "B.A",
    "OND",
    "HND",
    "Post Graduate",
    "None"
  ];

  List<String> dropdownItemLGender = ["Male", "Female"];

  String selectedEducationOption = "BSC";

  TextEditingController phoneController = TextEditingController();

  PlatformFile? file;
  File? image;

  int selectedCountry = 161;
  String selectedCountryName = "Nigeria";

  int selectedState = 306;
  String selectedStateName = "Lagos";

  String gender = "";

  Future<dynamic>? countriesFuture;
  Future<dynamic>? statesFuture;

  var new_employer_info = [];

  @override
  void initState() {
    super.initState();
    // Call getCountries when the widget initializes

    new_employer_info = Hive.box("artisan").get("new_employer_info");
    countriesFuture = Default().getCountries();
    statesFuture = Default().getStates(selectedCountry.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
                child: Container(
                    width: double.maxFinite,
                    //  height: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.h, vertical: 12.v),
                    child: Column(children: [
                      Container(
                          width: 327.h,
                          margin: EdgeInsets.symmetric(horizontal: 26.h),
                          child: Text(
                              "Fill in your information below to create account as an employer",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium)),
                      SizedBox(height: 38.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("First Name",
                              style: theme.textTheme.bodyMedium)),
                      SizedBox(height: 6.v),
                      CustomTextFormField(
                          controller: firstNameController,
                          hintText: "eg: Kingsley ",
                          hintStyle: theme.textTheme.titleSmall!),
                      SizedBox(height: 38.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Last Name",
                              style: theme.textTheme.bodyMedium)),
                      SizedBox(height: 6.v),
                      CustomTextFormField(
                          controller: lastNameController,
                          hintText: "eg  Leo",
                          hintStyle: theme.textTheme.titleSmall!),
                      SizedBox(height: 27.v),
                      _buildEgCEO1(context),
                      SizedBox(height: 27.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.h),
                          child: CustomDropDown(
                              icon: Container(
                                  padding: EdgeInsets.all(3.h),
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 14.v, 20.h, 14.v),
                                  decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(9.h)),
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgCheckmark,
                                      height: 11.adaptSize,
                                      width: 11.adaptSize)),
                              hintText: "Educational Qualifications",
                              items: dropdownItemList1,
                              onChanged: (value) {
                                setState(() {
                                  selectedEducationOption = value;
                                });
                              })),
                      SizedBox(height: 28.v),
                      _buildCountry1(context),
                      SizedBox(height: 28.v),
                      _buildPhone1(context),
                      SizedBox(height: 29.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(children: [
                            Text("Upload Company Logo\n(optional)",
                                style: theme.textTheme.bodyMedium),
                            Padding(
                                padding: EdgeInsets.only(left: 38.h),
                                child: Text("City",
                                    style: theme.textTheme.bodyMedium))
                          ])),
                      SizedBox(height: 5.v),
                      _buildChooseFile(context),
                      SizedBox(height: 14.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgEmojioneMonoto,
                                height: 24.adaptSize,
                                width: 24.adaptSize),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 11.h, top: 4.v, bottom: 2.v),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "I Agree With The",
                                          style: CustomTextStyles
                                              .titleSmallff3a332c_1),
                                      TextSpan(text: " "),
                                      TextSpan(
                                          text: "Terms and Conditions",
                                          style: CustomTextStyles
                                              .titleSmallfff7941e_1)
                                    ]),
                                    textAlign: TextAlign.left))
                          ])),
                      SizedBox(height: 35.v),
                      CustomElevatedButton(
                        text: "Submit",
                        onPressed: (() {
                          if ( //_emailController.text.isNotEmpty &&
                              companyController.text.isNotEmpty &&
                                  firstNameController.text.isNotEmpty &&
                                  lastNameController.text.isNotEmpty &&
                                  phoneController.text.isNotEmpty &&
                                  // selectedCountry != null &&
                                  cityController.text.isNotEmpty) {
                            EasyLoading.show();
                            Auth()
                                .newEmployer(
                                    fullname: firstNameController.text +
                                        " " +
                                        lastNameController.text,
                                    email: new_employer_info[0],
                                    password: new_employer_info[1],
                                    confirmPassword: new_employer_info[1],
                                    phone: phoneController.text,
                                    country: selectedCountry,
                                    city: cityController.text,
                                    state: selectedState,
                                    businessName: companyController.text,
                                    logo: image,
                                    education_qualification:
                                        selectedEducationOption,
                                    companyName: companyController.text)
                                .then((value) => {
                                      //  Navigator.pushNamed(context, AppRoutes.jSLoginPageScreen),
                                      if (value == "success")
                                        {
                                          print(value.toString()),
                                          EasyLoading.dismiss(),
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Your account was created successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                          255, 86, 86, 86)
                                                      .withOpacity(0.6),
                                              textColor: Colors.white,
                                              fontSize: 16.0),
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      JSCreateAccountSuccess()))
                                        }
                                      else
                                        {
                                          EasyLoading.dismiss(),
                                          print(value.toString()),
                                          // Navigator.pop(context),

                                          Fluttertoast.showToast(
                                              msg: value.toString(),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                          255, 86, 86, 86)
                                                      .withOpacity(0.6),
                                              textColor: Colors.white,
                                              fontSize: 16.0)
                                        }
                                    });
                            //  Navigator.pushNamed(context, AppRoutes.employerRegisterPageOneScreen);
                          } else {
                            EasyLoading.showToast("Please fill out all fields");
                          }
                        }),
                      ),
                      SizedBox(height: 90.v),
                      SizedBox(
                          width: 130.h,
                          child: Divider(color: theme.colorScheme.onPrimary))
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 38.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftOnprimary,
            margin: EdgeInsets.only(left: 22.h, top: 17.v, bottom: 22.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Register"));
  }

  /// Section Widget
  Widget _buildEgCEO(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Office Title", style: theme.textTheme.bodyMedium),
              SizedBox(height: 7.v),
              CustomTextFormField(
                  width: 180.h,
                  controller: officeTitleController,
                  hintText: "e.g CEO",
                  hintStyle: theme.textTheme.titleSmall!)
            ])));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Company Name", style: theme.textTheme.bodyMedium),
              SizedBox(height: 5.v),
              CustomTextFormField(
                  width: 180.h,
                  controller: companyController,
                  hintText: "e.g ArtisanOga",
                  hintStyle: theme.textTheme.titleSmall!)
            ])));
  }

  /// Section Widget
  Widget _buildEgCEO1(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildEgCEO(context), _buildName(context)]);
  }

  /// Section Widget
  Widget _buildCountry(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Country", style: theme.textTheme.bodyMedium),
              SizedBox(height: 5.v),
              GestureDetector(
                  onTap: (() {
                    setState(() {});
                    showCoutryList(context);
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: Text(
                      selectedCountryName,
                      maxLines: 1,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(
                              255, 148, 148, 148)), // Slightly grayish border
                      borderRadius:
                          BorderRadius.circular(5.0), // Rounded corners
                    ),
                  ))
            ])));
  }

  /// Section Widget
  Widget _buildGender(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Gender", style: theme.textTheme.bodyMedium),
              SizedBox(height: 6.v),
              CustomDropDown(
                  width: 180.h,
                  icon: Container(
                      padding: EdgeInsets.all(3.h),
                      margin: EdgeInsets.fromLTRB(30.h, 14.v, 20.h, 14.v),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(9.h)),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCheckmark,
                          height: 11.adaptSize,
                          width: 11.adaptSize)),
                  hintText: "Male",
                  items: dropdownItemLGender,
                  onChanged: (value) {
                    print(value.toString());

                    setState(() {
                      gender = value.toString();
                    });
                  })
            ])));
  }

  /// Section Widget
  Widget _buildCountry1(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _buildCountry(context),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("City", style: theme.textTheme.bodyMedium),
                    SizedBox(height: 6.v),
                    CustomTextFormField(
                        controller: cityController,
                        hintText: "City",
                        hintStyle: theme.textTheme.titleSmall!),
                  ])))
    ]);
  }

  /// Section Widget
  Widget _buildPhone(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Phone no", style: theme.textTheme.bodyMedium),
              SizedBox(height: 6.v),
              CustomTextFormField(
                  width: 180.h,
                  controller: phoneController,
                  hintText: "e.g 703 345 1345",
                  hintStyle: theme.textTheme.titleSmall!,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.done)
            ])));
  }

  /// Section Widget
  Widget _buildState(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 10.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("State of Residence", style: theme.textTheme.bodyMedium),
              SizedBox(height: 5.v),
              GestureDetector(
                  onTap: (() {
                    showStates(context);
                  }),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: Text(
                      selectedStateName,
                      maxLines: 1,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(
                              255, 148, 148, 148)), // Slightly grayish border
                      borderRadius:
                          BorderRadius.circular(5.0), // Rounded corners
                    ),
                  ))
            ])));
  }

  /// Section Widget
  Widget _buildPhone1(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _buildState(context),
      _buildPhone(context),
    ]);
  }

  /// Section Widget
  Widget _buildChooseFile(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Container(
              margin: EdgeInsets.only(right: 10.h),
              padding: EdgeInsets.symmetric(vertical: 6.v),
              decoration: AppDecoration.outlineBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomElevatedButton(
                        onPressed: (() {
                          pickImage();
                        }),
                        height: 34.v,
                        width: 80.h,
                        text: "Choose File",
                        buttonStyle: CustomButtonStyles.fillBlueGray,
                        buttonTextStyle: theme.textTheme.labelMedium!),
                    Padding(
                        padding: EdgeInsets.only(top: 8.v, bottom: 10.v),
                        child: Text(
                            image == null ? "No file chosen" : "Image selected",
                            style: theme.textTheme.labelLarge))
                  ]))),
      Expanded(child: _buildGender(context))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  showCoutryList(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Country List'),
            content: Container(
                height: 500, // Set height as needed
                width: 300, // Set width as needed
                child: FutureBuilder<dynamic>(
                  future: countriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(
                          height: 50,
                          width: 50,
                        ),
                      ); // Show a loader while data is being fetched
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show error message if there's an error
                    } else if (snapshot.hasData) {
                      // Data is fetched successfully, use it here
                      var countries = snapshot.data;
                      return ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: (() async {
                              setState(() {
                                selectedCountry = countries[index]['id'];
                                selectedCountryName = countries[index]["name"];

                                statesFuture = Default()
                                    .getStates(selectedCountry.toString());
                              });

                              print(selectedCountryName);

                              Navigator.pop(context);
                            }),
                            title: Text(
                              countries[index]['name'],
                              style: TextStyle(color: Colors.black),
                            ), // Assuming 'name' is a key in your country data
                          );
                        },
                      );
                    } else {
                      print(snapshot.toString());
                      return Text(
                          'No data available'); // Show a message if there's no data
                    }
                  },
                )));
      },
    );
  }

  showStates(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('States List'),
            content: Container(
                height: 500, // Set height as needed
                width: 300, // Set width as needed
                child: FutureBuilder<dynamic>(
                  future: statesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(
                          height: 50,
                          width: 50,
                        ),
                      ); // Show a loader while data is being fetched
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show error message if there's an error
                    } else if (snapshot.hasData) {
                      // Data is fetched successfully, use it here
                      var states = snapshot.data;
                      return ListView.builder(
                        itemCount: states.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: (() {
                              setState(() {
                                print(states[index]['id'].toString());
                                selectedState = states[index]['id'];
                                selectedStateName = states[index]["name"];
                              });

                              print(selectedCountryName);

                              Navigator.pop(context);
                            }),
                            title: Text(
                              states[index]['name'],
                              style: TextStyle(color: Colors.black),
                            ), // Assuming 'name' is a key in your country data
                          );
                        },
                      );
                    } else {
                      print(snapshot.toString());
                      return Text(
                          'No data available'); // Show a message if there's no data
                    }
                  },
                )));
      },
    );
  }

  Future<void> pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage == null) return;

      final imageFile = File(pickedImage.path);
      setState(() {
        image = imageFile;
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
