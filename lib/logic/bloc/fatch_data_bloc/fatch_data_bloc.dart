import 'package:ecommerce_app/services/all_prudict.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/model/get_all_prudict.dart';
import 'package:flutter/material.dart';

part 'fatch_data_event.dart';
part 'fatch_data_state.dart';

class FatchDataBloc extends Bloc<FatchDataEvent, FatchDataState> {
  final Servises service;

  FatchDataBloc(this.service) : super(LoidingState()) {
    on<FatchDataEvent>((event, emit) async {
      if (event is FatchDataEveent) {
        emit(LoidingState());
        try {
          await Future.delayed(Duration(seconds: 2));
          final prudict = await service.getAllPrudict();
          emit(LoadedState(prudictList: prudict));
        } catch (ex) {
          emit(ErrorState(messige: "$ex"));
        }
      }
    });
  }
}
