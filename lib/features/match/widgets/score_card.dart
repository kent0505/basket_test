import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffCB6100).withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(64),
          topRight: Radius.circular(64),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const _StatisticsText(),
          const SizedBox(height: 40),
          _StatisticsData(
            title: 'Violations',
            data1: match.violations1,
            data2: match.violations2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Free throws',
            data1: match.freeThrows1,
            data2: match.freeThrows2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Shots from the center of the field',
            data1: match.fromCenter1,
            data2: match.fromCenter2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Shots under the basket',
            data1: match.underBasket1,
            data2: match.underBasket2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Player substitutions',
            data1: match.substitutions1,
            data2: match.substitutions2,
          ),
          const SizedBox(height: 13),
          _StatisticsData(
            title: 'Injuries',
            data1: match.injuries1,
            data2: match.injuries2,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _StatisticsText extends StatelessWidget {
  const _StatisticsText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Statistics',
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'P',
        shadows: <Shadow>[
          Shadow(
            color: AppColors.black25,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

class _StatisticsData extends StatelessWidget {
  const _StatisticsData({
    required this.title,
    required this.data1,
    required this.data2,
  });

  final String title;
  final String data1;
  final String data2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF',
            shadows: <Shadow>[
              Shadow(
                color: AppColors.black25,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
        Text(
          '$data1:$data2',
          style: TextStyle(
            color: const Color(0xff702626),
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF',
            shadows: <Shadow>[
              Shadow(
                color: AppColors.black25,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
