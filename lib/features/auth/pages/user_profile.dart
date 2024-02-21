import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:intention_for_today/app/cubit/root_page_cubit.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(),
      providers: [
        EmailAuthProvider(),
      ],
      actions: [
        SignedOutAction(
          (context) {
            Navigator.of(context).pop(RootPageCubit().signOut());
          },
        ),
      ],
      avatarSize: 24,
    );
  }
}
