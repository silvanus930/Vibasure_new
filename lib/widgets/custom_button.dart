import 'package:flutter/material.dart';
import 'package:main/utils/color_constant.dart';
import 'package:main/utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  Widget? prefixWidget;

  Widget? suffixWidget;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll3:
        return getPadding(
          all: 3,
        );
      case ButtonPadding.PaddingAll11:
        return getPadding(
          all: 11,
        );
      default:
        return getPadding(
          all: 14,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.orangeA200;
      case ButtonVariant.FillOrangeA202:
        return ColorConstant.orangeA202;
      case ButtonVariant.OutlineBluegray100:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillPink500:
        return ColorConstant.pink500;
      case ButtonVariant.FillDeeppurpleA200:
        return ColorConstant.deepPurpleA200;
      case ButtonVariant.OutlineYellow800:
        return ColorConstant.yellow800;
      default:
        return ColorConstant.orangeA200;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineBluegray100:
        return Border.all(
          color: ColorConstant.bluegray100,
          width: getHorizontalSize(
            1.17,
          ),
        );
      case ButtonVariant.OutlineYellow800:
        return Border.all(
          color: ColorConstant.yellow800,
          width: getHorizontalSize(
            1.17,
          ),
        );
      case ButtonVariant.FillOrangeA200:
      case ButtonVariant.OutlineBlack9003f:
      case ButtonVariant.FillOrangeA202:
      case ButtonVariant.FillPink500:
      case ButtonVariant.FillDeeppurpleA200:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.06,
          ),
        );
      case ButtonShape.RoundedBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.73,
          ),
        );
      case ButtonShape.CircleBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.39,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case ButtonVariant.OutlineYellow800:
        return [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          )
        ];
      case ButtonVariant.FillOrangeA200:
      case ButtonVariant.FillOrangeA202:
      case ButtonVariant.OutlineBluegray100:
      case ButtonVariant.FillPink500:
      case ButtonVariant.FillDeeppurpleA200:
        return null;
      default:
        return null;
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.ArialMT16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Arial',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsSemiBold88:
        return TextStyle(
          color: ColorConstant.bluegray90063,
          fontSize: getFontSize(
            8.8,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.ArialMT12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Arial',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.RobotoRegular12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsSemiBold88WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            8.8,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsSemiBold88Bluegray100:
        return TextStyle(
          color: ColorConstant.bluegray100,
          fontSize: getFontSize(
            8.8,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  CircleBorder25,
  CircleBorder8,
  RoundedBorder20,
  CircleBorder12,
}

enum ButtonPadding {
  PaddingAll14,
  PaddingAll3,
  PaddingAll11,
}

enum ButtonVariant {
  FillOrangeA200,
  OutlineBlack9003f,
  FillOrangeA202,
  OutlineBluegray100,
  FillPink500,
  FillDeeppurpleA200,
  OutlineYellow800,
}

enum ButtonFontStyle {
  RobotoBold16,
  ArialMT16,
  PoppinsSemiBold88,
  ArialMT12,
  RobotoRegular12,
  PoppinsSemiBold88WhiteA700,
  PoppinsSemiBold88Bluegray100,
}
