import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/match.dart';
import '../../../core/utils.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  List<MatchModel> _matches = [];

  MatchBloc() : super(MatchInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      if (matchesList.isEmpty) {
        _matches = await getModels();
        emit(MatchesLoadedState(matches: _matches));
      } else {
        emit(MatchesLoadedState(matches: _matches));
      }
    });

    on<AddMatchEvent>((event, emit) async {
      matchesList.add(event.match);
      _matches = await updateModels();
      emit(MatchesLoadedState(matches: _matches));
    });

    on<DeleteMatchEvent>((event, emit) async {
      matchesList.removeWhere((element) => element.id == event.id);
      _matches = await updateModels();
      emit(MatchesLoadedState(matches: _matches));
    });
  }
}
