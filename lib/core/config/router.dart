import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/match/pages/add_match_page.dart';
import '../../features/match/pages/edit_match_page.dart';
import '../../features/news/pages/news_detail_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/match.dart';
import '../models/news.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/news-detail',
      builder: (context, state) => NewsDetailPage(
        news: state.extra as News,
      ),
    ),
    GoRoute(
      path: '/add-match',
      builder: (context, state) => const AddMatchPage(),
    ),
    GoRoute(
      path: '/edit-match',
      builder: (context, state) => EditMatchPage(
        match: state.extra as MatchModel,
      ),
    ),
  ],
);
