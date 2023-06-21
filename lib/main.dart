import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:proarea_assignment/config/network/network_config.dart';
import 'package:proarea_assignment/routes/routes.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:proarea_assignment/ui/home/screen/home.dart';
import 'package:proarea_assignment/ui/splash/screen/splash_screen.dart';
import 'package:proarea_assignment/utils/styles.dart';

import 'bloc/home_bloc/home_bloc.dart';
import 'config/sizeConfig/size_config.dart';
import 'models/fact.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(FactAdapter());
  await Hive.openBox<Fact>('fact');
  NetworkConfig().initNetworkConfig();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Dio dio = NetworkConfig().dio;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: Styles.lightTheme,
      home: Builder(
        builder: (context) {
          final Size size = MediaQuery.of(context).size;
          SizeConfig.init(
            context,
            height: size.height,
            width: size.width,
            allowFontScaling: true,
          );
          return BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(dio: dio),
            child: const HomeScreen(),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
