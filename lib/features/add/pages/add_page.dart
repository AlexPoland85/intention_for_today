import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intention_for_today/app/core/enums.dart';
import 'package:intention_for_today/app/injection_container.dart';
import 'package:intention_for_today/features/add/cubit/add_page_cubit.dart';
import 'package:neopop/neopop.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? _intention;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddPageCubit>(
      create: (context) {
        return getIt();
      },
      child: BlocConsumer<AddPageCubit, AddPageState>(
        listener: (context, state) {
          if (state.saved == true) {
            widget.onSave();
          }
        },
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
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .addYourIntentionForToday,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _intention = newValue;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      NeoPopTiltedButton(
                        isFloating: true,
                        onTapUp: _intention == null
                            ? null
                            : () {
                                context
                                    .read<AddPageCubit>()
                                    .addUsersItem(content: _intention!);
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
                                AppLocalizations.of(context)!.add,
                                style: const TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
