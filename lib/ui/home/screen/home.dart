import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../bloc/home_bloc/home_event.dart';
import '../../../bloc/home_bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onLongPress: () {
        BlocProvider.of<HomeBloc>(context).add(FetchFact());
        debugPrint('PRESSEDD');
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(
              child: Text('Press the button to load a random Home.'),
            );
          } else if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            final fact = state.fact;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  fact.text,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  fact.createdAt.toString(),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    child: const Text('Another Home!'),
                    onPressed: () => BlocProvider.of<HomeBloc>(context).add(
                          FetchFact(),
                        )),
              ],
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Container();
        },
      ),
    ));
  }
}
