import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/app/cubit/root_page_cubit.dart';
import 'package:intention_for_today/features/auth/pages/auth_page.dart';
import 'package:intention_for_today/features/home/pages/home_page.dart';
import 'package:intention_for_today/app/injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intention for Today',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('pl'), // Polish
      ],
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootPageCubit>(
      create: (context) {
        return getIt()..start();
      },
      child: BlocBuilder<RootPageCubit, RootPageState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == Status.error) {
            return Center(
              child: Text(AppLocalizations.of(context)!.somethingWentWrong),
            );
          } else {
            final user = state.user;
            if (user == null) {
              return const AuthPage();
            } else {
              return const HomePage();
            }
          }
        },
      ),
    );
  }
}
