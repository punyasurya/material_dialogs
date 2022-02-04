library material_dialogs;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/widgets/dialogs/dialog_widget.dart';

export 'package:lottie/lottie.dart';

class Dialogs {
  ///[bcgColor] background default value
  static const Color bcgColor = const Color(0xfffefefe);

  ///[holder] holder for the custom view
  static const Widget holder = const SizedBox(
    height: 0,
  );

  /// [dialogShape] dialog outer shape
  static const ShapeBorder dialogShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  /// [BottomSheetShape] bottom dialog outer shape
  static const ShapeBorder BottomSheetShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)));

  /// Displays normal Material dialog above the current contents of the app
  /// [context] your parent widget context
  /// [color] dialog background color

  /// [actions] Widgets to display a row of buttons after the [msg] widget.
  /// [onClose] used to listen to dialog close events.

  static Future<void> materialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    List<Widget>? actions,
    Widget customView = holder,
    LottieBuilder? lottieBuilder,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    ShapeBorder dialogShape = dialogShape,
    Color color = bcgColor,
  }) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (context) {
        return Dialog(
          backgroundColor: color,
          shape: dialogShape,
          child: DialogWidget(
            actions: actions,
            customView: customView,
            color: color,
          ),
        );
      },
    ).then((value) => onClose?.call(value));
  }

  /// Displays bottom sheet Material dialog above the current contents of the app
  static void bottomMaterialDialog({
    required BuildContext context,
    Function(dynamic value)? onClose,
    List<Widget>? actions,
    Widget customView = holder,
    LottieBuilder? lottieBuilder,
    bool barrierDismissible = true,
    ShapeBorder dialogShape = BottomSheetShape,
    Color color = bcgColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    showModalBottomSheet(
      context: context,
      shape: dialogShape,
      backgroundColor: color,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      builder: (context) => DialogWidget(
        actions: actions,
        customView: customView,
        color: color,
      ),
    ).then((value) => onClose?.call(value));
  }
}
