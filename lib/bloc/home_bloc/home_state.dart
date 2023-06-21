import '../../models/fact.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Fact fact;

  const HomeLoaded(this.fact);

  @override
  List<Object?> get props => [fact];
}

class ImageLoading extends HomeState {}

class ImageLoaded extends HomeState {
  final String imageUrl;

  const ImageLoaded(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
