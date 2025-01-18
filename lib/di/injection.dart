import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// The global instance of [GetIt] for dependency injection.
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)

/// Configures the dependencies for the application.
void configureDependencies() => getIt.init();

@module

/// A module for Dio service.
abstract class DioModule {
  Dio get dio => Dio();
}
