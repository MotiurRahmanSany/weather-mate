import 'package:flutter/material.dart';

class ShowErrorToUser extends StatelessWidget {
  const ShowErrorToUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(Icons.error_outline_outlined,
          size: MediaQuery.of(context).size.width * 0.15),
      content:
          const Text('We are are facing some issues. Please try again later'),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {},
        ),
      ],
    );
  }
}
