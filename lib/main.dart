import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';
import 'core/constants/end_point.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';
import 'injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ///dependency injection
  configure();

  ///load base url
  await dotenv.load();

  /// defining the end point for calling the api
  EndPointConstant().init();

  ///setting the bloc observer
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => Builder(builder: (context) {
              return MaterialApp.router(
                  title: 'Weather',
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.light,
                  theme: createLightThemeData(),
                  darkTheme: createDarkThemeData(),

                  ///defining the application route
                  routerConfig: goRouter);
            }));
  }
}
