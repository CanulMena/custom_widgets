import 'package:custom_widgets/presentation/screens/block-color-changer/changer_block_color_screen.dart';
import 'package:custom_widgets/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[

    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen()
    ),

    GoRoute(
      path: '/buttons',
      builder: (BuildContext context, GoRouterState state) => const ButtonScreen()
    ),

    GoRoute(
      path: '/cards',
      builder: (BuildContext context, GoRouterState state) => const CardsScreen()
    ),

    GoRoute(
      path: '/progress',
      builder: (BuildContext context, GoRouterState state) => const ProgressScren()
    ),

    GoRoute(
      path: '/snackbars',
      builder: (BuildContext context, GoRouterState state) => const SnackbarScreen()
    ),

    GoRoute(
      path: '/animateds',
      builder: (BuildContext context, GoRouterState state) => const AnimatesScreen()
    ),
    
    GoRoute(
      path: '/ui-controls',
      builder: (BuildContext context, GoRouterState state) => const UiControllsScreen()
    ),

    GoRoute(
      path: '/tutorials',
      builder: (BuildContext context, GoRouterState state) => const AppTutorialScreen()
    ),

    GoRoute(
      path: '/infinite',
      builder: (BuildContext context, GoRouterState state) => const InfiniteScrollScreen()
    ),

    GoRoute(
      path: '/counter',
      builder: (BuildContext context, GoRouterState state) => const CounterScreen()
    ),
    
    GoRoute(
      path: '/changer-theme',
      builder: (BuildContext context, GoRouterState state) => const ThemeChangerScreen()
    ),

    GoRoute(
      path: '/changer-block-color',
      builder: (BuildContext context, GoRouterState state) => const ChangerBlockColorScreen()
    ),
  ],
);