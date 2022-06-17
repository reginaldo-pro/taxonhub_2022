import 'package:flutter/material.dart';
import 'package:front_end/routes/routes.dart';
import 'package:front_end/screens/home/home.dart';
import 'package:front_end/screens/main.dart';
import 'package:vrouter/vrouter.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppTaxonHub();
  }
}

class AppTaxonHub extends StatefulWidget {
  const AppTaxonHub({Key? key}) : super(key: key);

  @override
  State<AppTaxonHub> createState() => _AppTaxonHubState();
}

class _AppTaxonHubState extends State<AppTaxonHub> {
  @override
  Widget build(BuildContext context) {
    return VRouter(
      buildTransition: (animation, _, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 50),
      onGenerateTitle: (context) => context.T.title,
      localizationsDelegates: T.localizationsDelegates,
      supportedLocales: T.supportedLocales,
      routes: [
        VNester(
          path: RoutesApp.main,
          widgetBuilder: (child) => Main(child: child),
          nestedRoutes: [
            VWidget(
              path: RoutesApp.home,
              widget: const HomePage(),
            ),
          ],
        ),
      ],
    );
  }
}
