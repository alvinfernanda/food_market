part of 'coba_bloc.dart';

abstract class CobaState extends Equatable {
  const CobaState();
  
  @override
  List<Object> get props => [];
}

class CobaInitial extends CobaState {}
