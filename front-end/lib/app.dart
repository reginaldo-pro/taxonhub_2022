import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/bloc/searchs/searchs_bloc.dart';
import 'package:front_end/providers/occurrence.dart';
import 'package:front_end/providers/taxonomic.dart';
import 'package:front_end/routes/routes.dart';
import 'package:front_end/screens/home/home.dart';
import 'package:front_end/screens/main.dart';
import 'package:front_end/screens/occurrences_search/occurrences_search.dart';
import 'package:front_end/screens/taxonomic_search/taxonomic_search.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import 'package:front_end/utils/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaxonomicProvider()),
        ChangeNotifierProvider(create: (_) => OcurrenceProvider()),
        BlocProvider<SearchsBloc>(
          create: (context) => SearchsBloc(),
        ),
      ],
      child: const AppTaxonHub(),
    );
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
              path: null,
              widget: const HomePage(),
            ),
            VWidget(
              path: RoutesApp.taxonomicSearch,
              widget: const TaxonomicSearch(),
            ),
            VWidget(
              path: RoutesApp.occurrencesSearch,
              widget: const OccurrencesSearch(),
            ),
          ],
        ),
      ],
    );
  }
}
