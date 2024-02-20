import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/data/remote_data_sources_firebase/items_remote_data_source.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'package:intention_for_today/features/add/pages/add_page.dart';
import 'package:intention_for_today/features/auth/pages/user_profile.dart';
import 'package:intention_for_today/features/details/pages/details_page.dart';
import 'package:intention_for_today/features/home/cubit/home_page_cubit.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:neopop/widgets/shimmer/neopop_shimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
        title: const Text('Have a Great Day!'),
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
              const SnackBar(
                content: Text('Intention added'),
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
        backgroundColor: Colors.lightGreen,
        initialActiveIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
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
    return BlocProvider(
      create: (context) =>
          HomePageCubit(ItemsRepository(ItemsRemoteDataSource()))
            ..start(id: ''),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return const Center(
                child: Text('Initial state'),
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
                        text: 'Intention for Today',
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
                      child: const NeoPopShimmer(
                        shimmerColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 70, vertical: 15),
                          child: Text(
                            'Draw >',
                            style: TextStyle(
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
