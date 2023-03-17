import 'package:flutter/material.dart';
import 'package:technical_exam/ui/components/dialogs/error.dart';

class DialogsServices {

  void showErrorMessage(BuildContext context, {
    required String message,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation1, animation2, widget) {
        const Offset begin = Offset(0.0, 1.0);
        const Offset end = Offset.zero;
        const Curve curve = Curves.easeInOut;
        Animatable<Offset> tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation1.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: Opacity(
            opacity: animation1.value,
            child: ErrorDialog(message: message),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
    );
  }
}