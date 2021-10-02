import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coba_event.dart';
part 'coba_state.dart';

class CobaBloc extends Bloc<CobaEvent, CobaState> {
  CobaBloc() : super(CobaInitial());

  @override
  Stream<CobaState> mapEventToState(
    CobaEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
