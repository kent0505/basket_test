import 'package:basket_test/core/widgets/buttons/delete_button.dart';
import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'buttons/arrow_back_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
    this.title, {
    super.key,
    this.back = true,
    this.shadow = false,
    this.delete,
  });

  final String title;
  final bool back;
  final bool shadow;
  final void Function()? delete;

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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF',
                  shadows: <Shadow>[
                    if (shadow)
                      Shadow(
                        color: AppColors.black25,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                  ],
                ),
              ),
            ),
          ),
          if (back) ...[
            if (delete != null) ...[
              DeleteButton(onDelete: delete!),
            ] else
              const SizedBox(width: 100),
          ]
        ],
      ),
    );
  }
}
