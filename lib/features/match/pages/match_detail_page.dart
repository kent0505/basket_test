import 'package:flutter/material.dart';

import '../../../core/models/match.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class MatchDetailPage extends StatelessWidget {
  const MatchDetailPage({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Match', back: false),
          const CustomAppbar(''),
          const SizedBox(height: 40),
          Text(
            match.eventName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w500,
              fontFamily: 'P',
            ),
          ),
          const SizedBox(height: 40),
          const Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
