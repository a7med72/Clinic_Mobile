import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppExtension on num {
  /// ---------------------------
  /// SizedBox Space
  /// ---------------------------

  SizedBox get vh => SizedBox(height: h);

  SizedBox get vw => SizedBox(width: w);

  /// ---------------------------
  /// Padding
  /// ---------------------------

  EdgeInsets get allPadding => EdgeInsets.all(w);

  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: w);

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: h);

  EdgeInsets get topPadding => EdgeInsets.only(top: h);

  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: h);

  EdgeInsets get leftPadding => EdgeInsets.only(left: w);

  EdgeInsets get rightPadding => EdgeInsets.only(right: w);
  EdgeInsets get paddingAll =>
      EdgeInsets.only(top: h, right: w, left: w, bottom: h);
      
       EdgeInsets paddingOnly({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsets.only(
      top: (top ?? 0).h,
      bottom: (bottom ?? 0).h,
      left: (left ?? 0).w,
      right: (right ?? 0).w,
    );
  }

  /// ---------------------------
  /// Radius
  /// ---------------------------

  BorderRadius get radius => BorderRadius.circular(r);

  /// ---------------------------
  /// Responsive Width & Height
  /// ---------------------------

  double get width => w;

  double get height => h;

  double get responsiveRadius => r;

  double get text => sp;

  /// ---------------------------
  /// Duration
  /// ---------------------------

  Duration get ms => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  /// ---------------------------
  /// Divider
  /// ---------------------------

  Widget get divider => Divider(height: h);

  /// ---------------------------
  /// Sliver Space
  /// ---------------------------

  SliverToBoxAdapter get sliverVSpace =>
      SliverToBoxAdapter(child: SizedBox(height: h));

  SliverToBoxAdapter get sliverHSpace =>
      SliverToBoxAdapter(child: SizedBox(width: w));
}
