import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jera_muvver/src/app_widget.dart';

void main() {
  _initialConfiguration();

  runApp(const MuvverApp());
}

void _initialConfiguration() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
