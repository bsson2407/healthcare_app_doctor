// import 'icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



enum DefaultThemes {
  info,
  success,
  error,
  warning,
}

enum LayoutType {
  ltr,
  rtl,
  center,
}

enum TYPE {
  info,
  input,
  singleChoiceSelector,
}

Map<DefaultThemes, IconData> themesIcons = {
  DefaultThemes.info: BlurryIcons.infoIcon,
  DefaultThemes.error: BlurryIcons.errorIcon,
  DefaultThemes.success: BlurryIcons.successIcon,
  DefaultThemes.warning: BlurryIcons.warningIcon
};


class BlurryIcons {
  static const IconData infoIcon = Icons.info;
  static const IconData successIcon = Icons.check_circle_rounded;
  static const IconData errorIcon = Icons.error;
  static const IconData warningIcon = Icons.warning_rounded;
}
