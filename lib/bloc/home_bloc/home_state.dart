import '../../models/fact.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class FactLoading extends HomeState {}

class FactLoaded extends HomeState {
  final Fact fact;

  const FactLoaded(this.fact);

  @override
  List<Object?> get props => [fact];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
