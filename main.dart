import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:proficient_lawyer/app/router.gr.dart' as router;
import 'package:proficient_lawyer/ui/media/app_colors.dart';
import 'package:proficient_lawyer/ui/widgets/dialog/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupDialogUi();
  runApp(DevicePreview(
    // Set enable to true for viewing in different device views
    enabled: false,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator.builder(
          router: router.Router(),
          navigatorKey: locator<NavigationService>().navigatorKey,
          initialRoute: router.Routes.splashScreenView,
          builder: (context, extendedNav) => Theme(
            data: ThemeData(
              primaryColor: AppColor.primary,
              canvasColor: AppColor.appBg,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            child: extendedNav,
          ),
        ),
      ),
    );
  }
}
