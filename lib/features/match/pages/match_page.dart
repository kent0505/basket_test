import 'package:flutter/material.dart';

import '../../../core/models/match.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../widgets/add_match_button.dart';
import '../widgets/match_card.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar('Matches', back: false),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              const SizedBox(height: 20),
              const Text(
                'Your Team',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'P',
                ),
              ),
              const SizedBox(height: 16),
              // weekday tabs
              const SizedBox(height: 30),
              ...List.generate(
                matchModelList.length,
                (index) {
                  return MatchCard(match: matchModelList[index]);
                },
              ),
              const AddMatchButton(),
            ],
          ),
        ),
      ],
    );
  }
}
