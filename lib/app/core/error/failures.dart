import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Failure extends Equatable {
  final String message;

  Failure({this.message});

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {}

class ExpiredTokenFailure extends Failure {}

class CacheFailure extends Failure {}

class BusinessFailure extends Failure {
  BusinessFailure({@required message}) : super(message: message);
}
