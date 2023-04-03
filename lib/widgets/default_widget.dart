import 'package:flutter/material.dart';

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}
