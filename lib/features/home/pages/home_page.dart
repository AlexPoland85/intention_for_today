import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/app/injection_container.dart';
import 'package:intention_for_today/features/add/pages/add_page.dart';
import 'package:intention_for_today/features/auth/pages/user_profile.dart';
import 'package:intention_for_today/features/details/pages/details_page.dart';
import 'package:intention_for_today/features/home/cubit/home_page_cubit.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:neopop/widgets/shimmer/neopop_shimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.intentionForToday),
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 20.0,
        ),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return AddPage(onSave: () {
            setState(() {
              currentIndex = 1;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.intentionAdded),
                backgroundColor: Colors.grey,
              ),
            );
          });
        }
        if (currentIndex == 1) {
          return const _HomePageBody();
        }
        return const UserProfile();
      }),
      bottomNavigationBar: ConvexAppBar(
        key: ValueKey(currentIndex),
        backgroundColor: Colors.lightGreen,
        initialActiveIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: [
          TabItem(
              icon: Icons.add, title: AppLocalizations.of(context)!.addIcon),
          TabItem(
              icon: Icons.home, title: AppLocalizations.of(context)!.homeIcon),
          TabItem(
              icon: Icons.people,
              title: AppLocalizations.of(context)!.profileIcon),
        ],
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) {
        return getIt()..start(id: '');
      },
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return Center(
                child: Text(AppLocalizations.of(context)!.initialState),
              );
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.error:
              return Center(
                child: Text(state.errorMessage ?? 'Error'),
              );
            case Status.success:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300.0,
                      child: TextLiquidFill(
                        text: AppLocalizations.of(context)!.intentionForToday,
                        waveColor: Colors.lightGreen,
                        boxBackgroundColor:
                            const Color.fromRGBO(203, 232, 169, 1),
                        textStyle: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        boxHeight: 150.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                        ));
                      },
                      decoration: const NeoPopTiltedButtonDecoration(
                        color: Color(0xFFffe22d),
                        plunkColor: Color(0xffc3a13b),
                        shadowColor: Colors.grey,
                      ),
                      child: NeoPopShimmer(
                        shimmerColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 15),
                          child: Text(
                            AppLocalizations.of(context)!.draw,
                            style: const TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
