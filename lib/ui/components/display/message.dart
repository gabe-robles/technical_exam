import 'package:flutter/material.dart';

class DisplayMessage extends StatelessWidget {
  const DisplayMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(message,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
