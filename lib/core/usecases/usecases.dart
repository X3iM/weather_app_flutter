import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class Params extends Equatable {
  Map<String, dynamic>? getParams();
}

class NoParams extends Params {
  @override
  List<Object> get props => [];

  @override
  Map<String, dynamic>? getParams() => null;
}

class WithParams extends Params {
  final Map<String, dynamic> params;

  WithParams({required this.params});

  @override
  List<Object?> get props => [
    params
  ];

  @override
  Map<String, dynamic>? getParams() => params;

}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
