import 'dart:async';

import 'package:bloc_sqflite_caching_data/core/internet_connection/logic/internet_connection_event.dart';
import 'package:bloc_sqflite_caching_data/core/internet_connection/logic/internet_connection_state.dart';
import 'package:bloc_sqflite_caching_data/features/home/local/local_product_db.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnectionBloc
    extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final LocalProductDB _localProductDB;

  InternetConnectionBloc(this._localProductDB)
      : super(InternetConnectionInitialState()) {
    on<InternetConnectionEvent>(_internetConnection);
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi)) {
          add(ConnectedInternetEvent());
        } else {
          add(NotConnectedInternetEvent());
        }
      },
    );
  }

  Future<void> _internetConnection(InternetConnectionEvent event,
      Emitter<InternetConnectionState> emit) async {
    if (event is ConnectedInternetEvent) {
      emit(ConnectedInternetState());
    } else if (event is NotConnectedInternetEvent) {
      final product = await _localProductDB
          .getAllProductsFromDB()
          .then((product) => product.isEmpty);

      if (product) {
        emit(NotConnectedInternetState(false));
      } else {
        emit(NotConnectedInternetState(true));
      }
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
