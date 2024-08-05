import 'package:flutter/material.dart';

@immutable
sealed class InternetConnectionEvent {}


final class ConnectedInternetEvent extends InternetConnectionEvent {}

final class NotConnectedInternetEvent extends InternetConnectionEvent {}
