import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/location_entity.dart';
import '../../injectable.dart';
import '../../presentation/cubits/forecast/forecast_cubit.dart';
import '../../presentation/cubits/location/location_cubit.dart';
import '../../presentation/pages/forecast/forecast_page.dart';
import '../../presentation/pages/location/location_page.dart';
import 'router_path.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// The route configuration.
final goRouter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          name: 'location',
          path: '/',
          routes: [
            GoRoute(
                name: 'forecast',
                path: RouterPath.forecast,
                builder: (BuildContext context, GoRouterState state) {
                  final LocationEntity(:id) = state.extra as LocationEntity;
                  return BlocProvider(
                      create: (_) =>
                          getIt<ForecastCubit>()..forecastId(id: id!),
                      child: const ForecastPage());
                })
          ],
          builder: (context, state) => BlocProvider(
              create: (_) => getIt<LocationCubit>(),
              child: const LocationPage())),
    ]);
