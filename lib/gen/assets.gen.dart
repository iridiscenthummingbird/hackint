/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SourceSansPro-Black.ttf
  String get sourceSansProBlack => 'assets/fonts/SourceSansPro-Black.ttf';

  /// File path: assets/fonts/SourceSansPro-Regular.ttf
  String get sourceSansProRegular => 'assets/fonts/SourceSansPro-Regular.ttf';

  /// List of all assets
  List<String> get values => [sourceSansProBlack, sourceSansProRegular];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add_event.svg
  SvgGenImage get addEvent => const SvgGenImage('assets/icons/add_event.svg');

  /// File path: assets/icons/arrowLeftIcon.svg
  SvgGenImage get arrowLeftIcon =>
      const SvgGenImage('assets/icons/arrowLeftIcon.svg');

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// File path: assets/icons/calendarEventIcon.svg
  SvgGenImage get calendarEventIcon =>
      const SvgGenImage('assets/icons/calendarEventIcon.svg');

  /// File path: assets/icons/calendarIcon.svg
  SvgGenImage get calendarIcon =>
      const SvgGenImage('assets/icons/calendarIcon.svg');

  /// File path: assets/icons/classRoomIcon.svg
  SvgGenImage get classRoomIcon =>
      const SvgGenImage('assets/icons/classRoomIcon.svg');

  /// File path: assets/icons/clockIcon.svg
  SvgGenImage get clockIcon => const SvgGenImage('assets/icons/clockIcon.svg');

  /// File path: assets/icons/dandruffIcon.svg
  SvgGenImage get dandruffIcon =>
      const SvgGenImage('assets/icons/dandruffIcon.svg');

  /// File path: assets/icons/date.svg
  SvgGenImage get date => const SvgGenImage('assets/icons/date.svg');

  /// File path: assets/icons/drop_down.svg
  SvgGenImage get dropDown => const SvgGenImage('assets/icons/drop_down.svg');

  /// File path: assets/icons/fileAddingIcon.svg
  SvgGenImage get fileAddingIcon =>
      const SvgGenImage('assets/icons/fileAddingIcon.svg');

  /// File path: assets/icons/graduate Icon.svg
  SvgGenImage get graduateIcon =>
      const SvgGenImage('assets/icons/graduate Icon.svg');

  /// File path: assets/icons/locationIcon.svg
  SvgGenImage get locationIcon =>
      const SvgGenImage('assets/icons/locationIcon.svg');

  /// File path: assets/icons/logOutIcon.svg
  SvgGenImage get logOutIcon =>
      const SvgGenImage('assets/icons/logOutIcon.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/moreDotsIcon.svg
  SvgGenImage get moreDotsIcon =>
      const SvgGenImage('assets/icons/moreDotsIcon.svg');

  /// File path: assets/icons/pencilEditIcon.svg
  SvgGenImage get pencilEditIcon =>
      const SvgGenImage('assets/icons/pencilEditIcon.svg');

  /// File path: assets/icons/searchIcon.svg
  SvgGenImage get searchIcon =>
      const SvgGenImage('assets/icons/searchIcon.svg');

  /// File path: assets/icons/time.svg
  SvgGenImage get time => const SvgGenImage('assets/icons/time.svg');

  /// File path: assets/icons/userIcon.svg
  SvgGenImage get userIcon => const SvgGenImage('assets/icons/userIcon.svg');

  /// File path: assets/icons/userProfileIcon.svg
  SvgGenImage get userProfileIcon =>
      const SvgGenImage('assets/icons/userProfileIcon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        addEvent,
        arrowLeftIcon,
        back,
        calendarEventIcon,
        calendarIcon,
        classRoomIcon,
        clockIcon,
        dandruffIcon,
        date,
        dropDown,
        fileAddingIcon,
        graduateIcon,
        locationIcon,
        logOutIcon,
        menu,
        moreDotsIcon,
        pencilEditIcon,
        searchIcon,
        time,
        userIcon,
        userProfileIcon
      ];
}

class Assets {
  Assets._();

  static const SvgGenImage beluga = SvgGenImage('assets/beluga.svg');
  static const AssetGenImage belugaLogo =
      AssetGenImage('assets/beluga_logo.png');
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const AssetGenImage logoBackground =
      AssetGenImage('assets/logo_background.png');
  static const AssetGenImage noEvents = AssetGenImage('assets/no_events.png');
  static const SvgGenImage uploadImage = SvgGenImage('assets/uploadImage.svg');

  /// List of all assets
  List<dynamic> get values =>
      [beluga, belugaLogo, logoBackground, noEvents, uploadImage];
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
