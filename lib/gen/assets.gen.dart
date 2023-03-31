/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/course-active.png
  AssetGenImage get courseActive =>
      const AssetGenImage('assets/icons/course-active.png');

  /// File path: assets/icons/course.png
  AssetGenImage get course => const AssetGenImage('assets/icons/course.png');

  /// File path: assets/icons/exam_icon.png
  AssetGenImage get examIcon =>
      const AssetGenImage('assets/icons/exam_icon.png');

  /// File path: assets/icons/gold-cup.png
  AssetGenImage get goldCup => const AssetGenImage('assets/icons/gold-cup.png');

  /// File path: assets/icons/home-active-2.png
  AssetGenImage get homeActive2 =>
      const AssetGenImage('assets/icons/home-active-2.png');

  /// File path: assets/icons/home-active.png
  AssetGenImage get homeActive =>
      const AssetGenImage('assets/icons/home-active.png');

  /// File path: assets/icons/home.png
  AssetGenImage get homePng => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/home.svg
  String get homeSvg => 'assets/icons/home.svg';

  /// File path: assets/icons/message.png
  AssetGenImage get message => const AssetGenImage('assets/icons/message.png');

  /// File path: assets/icons/questions.png
  AssetGenImage get questions =>
      const AssetGenImage('assets/icons/questions.png');

  /// File path: assets/icons/student-active.png
  AssetGenImage get studentActive =>
      const AssetGenImage('assets/icons/student-active.png');

  /// File path: assets/icons/student-green.png
  AssetGenImage get studentGreen =>
      const AssetGenImage('assets/icons/student-green.png');

  /// File path: assets/icons/student.png
  AssetGenImage get student => const AssetGenImage('assets/icons/student.png');

  /// File path: assets/icons/teacher-active.png
  AssetGenImage get teacherActive =>
      const AssetGenImage('assets/icons/teacher-active.png');

  /// File path: assets/icons/teacher.png
  AssetGenImage get teacher => const AssetGenImage('assets/icons/teacher.png');

  /// File path: assets/icons/waiting-2.png
  AssetGenImage get waiting2 =>
      const AssetGenImage('assets/icons/waiting-2.png');

  /// File path: assets/icons/waiting-active.png
  AssetGenImage get waitingActive =>
      const AssetGenImage('assets/icons/waiting-active.png');

  /// File path: assets/icons/waiting.png
  AssetGenImage get waiting => const AssetGenImage('assets/icons/waiting.png');

  /// List of all assets
  List<dynamic> get values => [
        courseActive,
        course,
        examIcon,
        goldCup,
        homeActive2,
        homeActive,
        homePng,
        homeSvg,
        message,
        questions,
        studentActive,
        studentGreen,
        student,
        teacherActive,
        teacher,
        waiting2,
        waitingActive,
        waiting
      ];
}

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/admin-panel-courses.png
  AssetGenImage get adminPanelCourses =>
      const AssetGenImage('assets/img/admin-panel-courses.png');

  /// File path: assets/img/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/img/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [adminPanelCourses, logo];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImgGen img = $AssetsImgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
