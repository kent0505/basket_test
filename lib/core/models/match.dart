class MatchModel {
  final int id;
  final String name1;
  final String name2;
  final String score1;
  final String score2;
  final String eventTime;
  final String eventName;

  MatchModel({
    required this.id,
    required this.name1,
    required this.name2,
    required this.score1,
    required this.score2,
    required this.eventTime,
    required this.eventName,
  });
}

List<MatchModel> matchModelList = [
  MatchModel(
    id: 1,
    name1: 'Kaspiy',
    name2: 'Kyran',
    score1: '2',
    score2: '4',
    eventTime: '19:20',
    eventName: 'Liga Pro G serie',
  ),
  MatchModel(
    id: 2,
    name1: 'Aaa',
    name2: 'Bbb',
    score1: '1',
    score2: '4',
    eventTime: '21:30',
    eventName: 'Liga Pro G serie',
  ),
  MatchModel(
    id: 3,
    name1: 'Ccc',
    name2: 'Ddd',
    score1: '0',
    score2: '2',
    eventTime: '23:00',
    eventName: 'Liga Pro G serie',
  ),
];
