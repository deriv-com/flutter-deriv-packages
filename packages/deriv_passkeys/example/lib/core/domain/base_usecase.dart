import 'package:dartz/dartz.dart';
import 'package:passkeys_poc/core/data/failures.dart';


abstract class BaseUsecase<Response,Request>{
Future<Either<BaseFailure,Response>> call(Request request);
}
class EmptyRequest {}