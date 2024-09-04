import 'package:flutter/material.dart';
import 'package:weather_mate/widgets/error_widget.dart';

void showError(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const ShowErrorToUser();
    },
  );
}
