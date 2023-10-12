import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/root_cubit.dart';

class MyAcountPageContent extends StatelessWidget {
  const MyAcountPageContent({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Jesteś zalogowany jako $email'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
            child: const Text('Wyloguj'),
          ),
        ],
      ),
    );
  }
}
