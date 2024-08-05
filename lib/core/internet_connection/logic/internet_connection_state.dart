abstract class InternetConnectionState {}

class InternetConnectionInitialState extends InternetConnectionState {}

class ConnectedInternetState extends InternetConnectionState {}

class NotConnectedInternetState extends InternetConnectionState {
  final bool isProductData;

  NotConnectedInternetState(this.isProductData);
}

