// ignore_for_file: void_checks
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../models/fact.dart';
import '../../services/repository.dart';
import 'home_state.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FactRepository _repository;

  HomeBloc({required Dio dio})
      : _repository = FactRepository(dio: dio),
        super(HomeInitial()) {
    on<FetchFact>(onGetRandomFact);
  }

  Future<void> onGetRandomFact(
    FetchFact event,
    Emitter<HomeState> emit,
  ) async {
    emit(FactLoading());
    try {
      final fact = await _repository.getRandomFact();

      final factBox = await FactBox.openBox();
      factBox.add(fact);
      emit(FactLoaded(fact));
    } catch (e) {
      emit(const HomeError('Failed to load fact'));
    }
  }
}
