import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intention_for_today/app/cubit/root_page_cubit.dart';
import 'package:intention_for_today/data/remote_data_sources_firebase/login_auth_data_source.dart';
import 'package:intention_for_today/domain/repositories/login_auth_repository.dart';
import 'package:intention_for_today/features/auth/pages/auth_page.dart';
import 'package:intention_for_today/features/home/pages/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intention for Today',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
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
    return BlocProvider(
      create: (context) =>
          RootPageCubit(LoginAuthRepository(LoginAuthDataSource()))..start(),
      child: BlocBuilder<RootPageCubit, RootPageState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          final user = state.user;
          if (user == null) {
            return const AuthPage();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}
