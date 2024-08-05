import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../bloc/match_bloc.dart';
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
              BlocBuilder<MatchBloc, MatchState>(
                builder: (context, state) {
                  if (state is MatchesLoadedState) {
                    if (state.matches.isEmpty) {
                      return Column(
                        children: [
                          Text(
                            '#Enemy',
                            style: TextStyle(
                              color: AppColors.black50,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'P',
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        ...List.generate(
                          matchesList.length,
                          (index) {
                            return MatchCard(match: matchesList[index]);
                          },
                        ),
                      ],
                    );
                  }

                  return Container();
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
