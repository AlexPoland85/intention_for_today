import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/data/remote_data_sources_firebase/items_remote_data_source.dart';
import 'package:intention_for_today/domain/repositories/items_repository.dart';
import 'package:intention_for_today/features/details/cubit/details_page_cubit.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:neopop/widgets/shimmer/neopop_shimmer.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Your Intention for Today is...'),
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 20.0,
        ),
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
                    if (state.selectedItem != null)
                      Dismissible(
                        key: ValueKey(state.selectedItem!.id),
                        background: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.delete,
                              ),
                            ),
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          return direction == DismissDirection.endToStart;
                        },
                        onDismissed: (direction) {
                          context
                              .read<DetailsPageCubit>()
                              .deleteItems(id: state.selectedItem!.id);
                        },
                        child: Container(
                          height: 150.0,
                          width: 300.0,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightGreen),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                state.selectedItem!.items,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(
                        height: 20.0,
                        child: Center(
                          child: Text('Swipe left to delete',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.lightGreen)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: () {
                        Navigator.pop(context);
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
