abstract class BaseFailure{
  final String message;
  const BaseFailure(this.message);
}

class ServerFailure extends BaseFailure{
  const ServerFailure({required String message}) : super(message);
}
