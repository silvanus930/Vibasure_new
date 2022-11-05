import 'package:flutter/material.dart';
import 'package:main/style/app_decoration.dart';
import 'package:main/style/app_style.dart';
import 'package:main/style/app_theme.dart';
import 'package:main/utils/color_constant.dart';
import 'package:main/utils/size_utils.dart';
import 'package:main/widgets/common_widget.dart';
import 'package:main/widgets/common_image_view.dart';
import 'package:main/widgets/custom_button.dart';
import 'package:main/widgets/custom_text_form_field.dart';

class SignOutScreen extends StatefulWidget {
  const SignOutScreen({super.key});
  @override
  _SignOutScreenState createState() => _SignOutScreenState();
}

class _SignOutScreenState extends State<SignOutScreen> {
  Widget getAppContainerUI() {
    return Column(children: <Widget>[
      Align(
          alignment: Alignment.center,
          child: Padding(
              padding: getPadding(left: 26, top: 10, right: 26),
              child: CommonImageView(
                imagePath: 'assets/images/slide_1.png',
              ))),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: getPadding(left: 26, top: 27, right: 26),
              child: Text("Time to Choose.time to Shop",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtAllisonRegular14))),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: getPadding(left: 28, top: 21, right: 28),
              child: Text("Welcome to VIBA",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtArialMT24Lightgreen800))),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: getPadding(left: 28, top: 2, right: 28),
              child: Text("One Stop Insurance Shop",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtArialMT16Black900))),
      CustomTextFormField(
          width: 294,
          focusNode: FocusNode(),
          hintText: "Sign In with Google",
          margin: getMargin(left: 26, top: 27, right: 26),
          variant: TextFormFieldVariant.OutlineBlack9002a,
          shape: TextFormFieldShape.RoundedBorder10,
          fontStyle: TextFormFieldFontStyle.RobotoMedium20,
          alignment: Alignment.center,
          prefix: Container(
              padding: getPadding(all: 1),
              margin: getMargin(left: 15, top: 15, right: 15, bottom: 18),
              decoration: BoxDecoration(color: ColorConstant.whiteA700),
              child: CommonImageView(
                  svgPath: 'assets/images/img_google_60X61.svg')),
          prefixConstraints: BoxConstraints(
              minWidth: getSize(23.00), minHeight: getSize(23.00))),
      Align(
          alignment: Alignment.center,
          child: Padding(
              padding: getPadding(left: 26, top: 26, right: 26),
              child: Text("or",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtArialMT20))),
      CustomTextFormField(
          width: MediaQuery.of(context).size.width * 0.75,
          focusNode: FocusNode(),
          hintText: " Enter your mobile Number",
          margin: getMargin(left: 26, top: 11, right: 26),
          padding: TextFormFieldPadding.PaddingAll12,
          textInputAction: TextInputAction.done,
          alignment: Alignment.center,
          validator: (value) {
            // if (!isValidPhone(value)) {
            //   return "Please enter valid phone number";
            // }
            return null;
          }),
      CommonWidgets.getAppButton("Sign Out", () {}),
      Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: getPadding(left: 23, top: 44, right: 23, bottom: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Don’t have a account",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtArialMT18Gray900),
                        GestureDetector(
                            onTap: () {},
                            child: Padding(
                                padding: getPadding(left: 16),
                                child: Text("Skip for Now",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtArialMT20Pink500)))
                      ]))))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme.bgColor,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              CommonWidgets.getAppBarUI(context, "Sign Out"),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                //height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    getAppContainerUI(),
                  ],
                ),
              )))
            ])));
  }
}
