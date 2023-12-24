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
  ],
);