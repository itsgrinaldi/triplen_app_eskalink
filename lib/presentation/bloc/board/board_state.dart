part of 'board_cubit.dart';

@immutable
abstract class BoardState {}

class BoardInitial extends BoardState {}

class BoardLoading extends BoardState {}

class BoardListLoaded extends BoardState {}

class BoardListLoadFailed extends BoardState {}
