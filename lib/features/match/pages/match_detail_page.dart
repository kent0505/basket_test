import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/match.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_listview.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../bloc/match_bloc.dart';
import '../widgets/event_name.dart';
import '../widgets/event_time.dart';
import '../widgets/score_card.dart';
import '../widgets/score_widget.dart';

class MatchDetailPage extends StatelessWidget {
  const MatchDetailPage({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(
            'Match',
            back: false,
            shadow: true,
          ),
          CustomAppbar(
            '',
            delete: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DeleteDialog(
                    title: 'Delete?',
                    onYes: () {
                      context
                          .read<MatchBloc>()
                          .add(DeleteMatchEvent(id: match.id));
                      context.pop();
                    },
                  );
                },
              );
            },
          ),
          Expanded(
            child: CustomListview(
              padding: 0,
              children: [
                const SizedBox(height: 40),
                EventName(match: match),
                const SizedBox(height: 40),
                ScoreWidget(match: match),
                const SizedBox(height: 12),
                EventTime(match: match),
                const SizedBox(height: 17),
                ScoreCard(match: match),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
