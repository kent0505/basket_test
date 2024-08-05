import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppbar('News', back: false),
      ],
    );
  }
}
