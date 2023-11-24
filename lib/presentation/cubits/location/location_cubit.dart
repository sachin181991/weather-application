import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failures.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final GetLocationRemoteUseCase _getLocationRemoteUseCase;

  LocationCubit({required GetLocationRemoteUseCase getLocationRemoteUseCase})
      : _getLocationRemoteUseCase = getLocationRemoteUseCase,
        super(const LocationState(locationList: []));

  bool isLoading = false;

  Future<void> location({required String search}) async {
    changeLoading();

    Either<Failure, List<LocationEntity>> response =
        await _getLocationRemoteUseCase(search);
    changeLoading();

    emit(response.fold(
        (exception) =>
            state.copyWith(locationList: [], error: exception.message),
        (locationResponse) => state.copyWith(locationList: locationResponse)));
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(state.copyWith(loading: isLoading));
  }
}
