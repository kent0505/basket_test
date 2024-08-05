import 'package:flutter/material.dart';

import '../../../core/models/match.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class EditMatchPage extends StatelessWidget {
  const EditMatchPage({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          CustomAppbar('Edit Match', back: false),
          CustomAppbar(''),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}
