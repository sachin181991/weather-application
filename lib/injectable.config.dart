// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api.dart' as _i7;
import 'core/api/api_consumer.dart' as _i4;
import 'core/api/dio_consumer.dart' as _i5;
import 'data/datasources/datasources.dart' as _i10;
import 'data/datasources/remote_datasource.dart' as _i6;
import 'data/repositories/weather_repository_impl.dart' as _i9;
import 'domain/repositories/domain_repositories.dart' as _i8;
import 'domain/usecases/get_forecast_remote_usecase.dart' as _i11;
import 'domain/usecases/get_location_remote_usecase.dart' as _i12;
import 'domain/usecases/usecases.dart' as _i14;
import 'injectable_singleton_module.dart' as _i16;
import 'presentation/cubits/forecast/forecast_cubit.dart' as _i15;
import 'presentation/cubits/location/location_cubit.dart' as _i13;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableSingletonModule = _$InjectableSingletonModule();
  gh.factory<_i3.Dio>(() => injectableSingletonModule.dio);
  gh.lazySingleton<_i4.ApiConsumer>(() => _i5.DioConsumer(dio: gh<_i3.Dio>()));
  gh.lazySingleton<_i6.RemoteDataSource>(
      () => _i6.RemoteDataSourceImpl(apiConsumer: gh<_i7.ApiConsumer>()));
  gh.lazySingleton<_i8.WeatherRepository>(() =>
      _i9.WeatherRepositoryImpl(remoteDataSource: gh<_i10.RemoteDataSource>()));
  gh.lazySingleton<_i11.GetForecastRemoteUseCase>(
      () => _i11.GetForecastRemoteUseCase(gh<_i8.WeatherRepository>()));
  gh.lazySingleton<_i12.GetLocationRemoteUseCase>(
      () => _i12.GetLocationRemoteUseCase(gh<_i8.WeatherRepository>()));
  gh.factory<_i13.LocationCubit>(() => _i13.LocationCubit(
      getLocationRemoteUseCase: gh<_i14.GetLocationRemoteUseCase>()));
  gh.factory<_i15.ForecastCubit>(() => _i15.ForecastCubit(
      getForecastRemoteUseCase: gh<_i14.GetForecastRemoteUseCase>()));
  return getIt;
}

class _$InjectableSingletonModule extends _i16.InjectableSingletonModule {}
