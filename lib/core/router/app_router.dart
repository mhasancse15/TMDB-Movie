import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/discover/presentation/screens/discover_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/movies/presentation/screens/movie_details_screen.dart';
import '../../features/people/presentation/screens/person_details_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/tv/presentation/screens/tv_details_screen.dart';
import '../../features/watchlist/presentation/screens/library_screen.dart';
import 'app_shell_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShellScaffold(navigationShell: navigationShell);
      },
      branches: [
        // Tab 1: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        // Tab 2: Search
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),

        // Tab 3: Discover
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/discover',
              builder: (context, state) => const DiscoverScreen(),
            ),
          ],
        ),

        // Tab 4: Library
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => const LibraryScreen(),
            ),
          ],
        ),

        // Tab 5: Profile
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    // Detail Routes
    GoRoute(
      path: '/movie/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return MovieDetailsScreen(movieId: id);
      },
    ),
    GoRoute(
      path: '/tv/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return TVDetailsScreen(tvId: id);
      },
    ),
    GoRoute(
      path: '/person/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return PersonDetailsScreen(personId: id);
      },
    ),
  ],
);
