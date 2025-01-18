import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:acc_hack/di/injection.config.dart';
import 'package:acc_hack/di/injection.dart';
import 'package:universal_html/html.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'dotenv');
  getIt.init();
  if (kIsWeb) {
    // <------------- I had to add this, it's not in the article
    createScriptElement(dotenv.get('GOOGLE_MAPS_API_KEY'));
  }
  runApp(await builder());
}

void createScriptElement(String key) {
  /// Create a new JS element
  ScriptElement script = ScriptElement();

  /// On that script element, add the `src` and `id` properties
  script.src = "https://maps.googleapis.com/maps/api/js?key=$key";
  script.id = "super-script";

  document.head?.append(script);
}
