import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/data/remote_data_sources_firebase/items_remote_data_source.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'package:intention_for_today/features/details/cubit/details_page_cubit.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:neopop/widgets/shimmer/neopop_shimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Your Intention for Today is...'),
      ),
      body: Builder(builder: (context) {
        return const _DetailsPageBody();
      }),
    );
  }
}

class _DetailsPageBody extends StatelessWidget {
  const _DetailsPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsPageCubit(ItemsRepository(ItemsRemoteDataSource()))
            ..drawItem(id: ''),
      child: BlocBuilder<DetailsPageCubit, DetailsPageState>(
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
                    if (state.selectedItem != null) ...[
                      Text(
                        state.selectedItem!.items,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                    const SizedBox(
                      height: 40,
                    ),
                    NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: () {
                        Navigator.pop(context);
                      },
                      decoration: const NeoPopTiltedButtonDecoration(
                        color: Color(0xFFffe22d),
                        plunkColor: Color(0xffc3a13b),
                        shadowColor: Colors.black,
                      ),
                      child: const NeoPopShimmer(
                        shimmerColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 70, vertical: 15),
                          child: Text(
                            '< Back',
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
