abstract class UseCaseWithParams<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCase<Type> {
  Future<Type> call();
}
