import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/configs/theme.dart';
import 'package:pokedex/routes.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: const Size.fromWidth(600),
      backgroundColor: Colors.black12,
      enabled: kIsWeb || !Platform.isAndroid && !Platform.isIOS,
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          title: 'Flutter Pokedex',
          theme: Themings.lightTheme,
          navigatorKey: AppNavigator.navigatorKey,
          onGenerateRoute: AppNavigator.onGenerateRoute,
          builder: (context, child) {
            if (child == null) return const SizedBox.shrink();

            final data = MediaQuery.of(context);
            final smallestSize = min(data.size.width, data.size.height);
            final textScaleFactor = min(smallestSize / AppConstants.designScreenSize.width, 1.0);

            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: textScaleFactor,
              ),
              child: child,
            );
          },
        );
      },
    );
  }
}
