import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Client get client => Client();
}
