import 'package:flutter/material.dart';

import 'buttons/arrow_back_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
    this.title, {
    super.key,
    this.back = true,
  });

  final String title;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (back) const ArrowBackButton(),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF',
                ),
              ),
            ),
          ),
          if (back) const SizedBox(width: 100),
        ],
      ),
    );
  }
}
