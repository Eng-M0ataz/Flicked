import 'package:flickd/core/utils/constants/device_type.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppSizes {
  // padding and margin sizes

  static const double paddingXs = 4.0;
  static const double paddingSm = 8.0;
  static const double paddingMd = 16.0;
  static const double paddingLg = 24.0;
  static const double paddingXl = 32.0;

  // icon sizes

  static const double xsIcon = 12.0;
  static const double smIcon = 16.0;
  static const double mdIcon = 24.0;
  static const double lgIcon = 32.0;

  // font sizes

  static const double xsFont = 12.0;
  static const double smFont = 14.0;
  static const double mdFont = 16.0;
  static const double lgFont = 18.0;
  static const double xlFont = 20.0;

  // button sizes

  static const double buttomHigh = 18.0;
  static const double buttomRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttomElevation = 4.0;

  // AppBar High

  static const double appBarHigh = 56.0;

  // Image sizes

  static const double imageHigh = 80.0;

  // Default Spacing Between Sections

  static const double defaultSpacing = 10.0;
  static const double spaceBetweenItems = 16.0;
  static const double spaceBetweenSections = 32.0;

  // Border Radius

  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;
  static const double borderRadiusXl = 16.0;

  // Divider Height

  static const double dividerHeight = 1.0;

  // input field

  static const double inputFieldRadius = 12.0;
  static const double spaceBetweenInputFields = 16.0;

  // card sizes

  static const double cardRadiusLg = 16.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusXs = 6.0;
  static const double cardElevation = 4.0;

  // image carousel high

  // loading indicator size

  // grid view spacing

  static const double gridSpacing = 16.0;

  // break points

  static const List<Breakpoint> appBreakPoints = [
    Breakpoint(start: 0, end: 450, name: DeviceType.mobile),
    Breakpoint(start: 451, end: 800, name: DeviceType.tablet),
    Breakpoint(start: 801, end: 1920, name: DESKTOP),
  ];
  static const List<Breakpoint> appLandscapeBreakPoints = [
    Breakpoint(start: 0, end: 1023, name: DeviceType.mobile),
    Breakpoint(start: 1024, end: 1599, name: DeviceType.tablet),
    Breakpoint(start: 1600, end: double.infinity, name: DESKTOP),
  ];
}
