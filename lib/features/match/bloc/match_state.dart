part of 'match_bloc.dart';

abstract class MatchState {}

final class MatchInitial extends MatchState {}

class MatchesLoadedState extends MatchState {
  final List<MatchModel> matches;
  MatchesLoadedState({required this.matches});
}
