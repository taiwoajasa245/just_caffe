import 'package:just_caffe/src/core/navigation/singleton_data.dart';
import 'package:just_caffe/src/core/theme/app_theme.dart';
import 'package:just_caffe/src/core/theme/dark_theme_mode.dart';
import 'package:just_caffe/src/core/theme/light_mode_theme.dart';
import 'package:just_caffe/src/shared/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_caffe/src/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return JustCaffeApp();
  }
}

class JustCaffeApp extends StatefulWidget {
  const JustCaffeApp({super.key});

  @override
  State<JustCaffeApp> createState() => _JustCaffeAppState();
}

class _JustCaffeAppState extends State<JustCaffeApp> {
  @override
  void initState() {
    AppTheme().setThemeMode(ThemeMode.system);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: Consumer<AppTheme>(
            builder: (context, appTheme, _) {
              // Resolve whether we're actually in dark mode
              // (context here is above MaterialApp, so Theme.of won't work)
              final bool isDark;
              if (appTheme.themeMode == ThemeMode.dark) {
                isDark = true;
              } else if (appTheme.themeMode == ThemeMode.light) {
                isDark = false;
              } else {
                isDark = MediaQuery.of(context).platformBrightness ==
                    Brightness.dark;
              }
              final overlayStyle = isDark
                  ? SystemUiOverlayStyle.light
                  : SystemUiOverlayStyle.dark;
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: overlayStyle,
                child: DismissKeyboard(
                  child: MaterialApp(
                    title: 'Just Caffe',
                    navigatorKey: SingletonData().navigationKey,
                    debugShowCheckedModeBanner: false,
                    darkTheme: darkTheme,
                    theme: lightTheme,
                    themeMode: appTheme.themeMode,
                    home: SplashScreen(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
