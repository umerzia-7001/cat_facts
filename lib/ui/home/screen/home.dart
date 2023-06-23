import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proarea_assignment/bloc/home_bloc/home_state.dart';
import 'package:proarea_assignment/ui/home/screen/history.dart';
import 'package:proarea_assignment/ui/home/widget/app_bar.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import '../../../bloc/home_bloc/home_event.dart';

import '../../../config/sizeConfig/size_config.dart';
import '../../../models/fact.dart';
import '../../../utils/constants.dart';
import '../../../utils/helpers.dart';
import '../widget/app_button.dart';
import '../widget/app_error.dart';
import '../widget/app_loader.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    _fetchFact();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchFact() {
    BlocProvider.of<HomeBloc>(context).add(FetchFact());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        showActions: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FactLoading) {
            return const AppLoader();
          } else if (state is HomeError) {
            return AppError(message: state.message, onPressed: _fetchFact);
          } else if (state is FactLoaded) {
            return FactWidget(fact: state.fact, onReload: _fetchFact);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class FactWidget extends StatelessWidget {
  final SizeConfig _config = SizeConfig();
  final void Function()? onReload;
  final Fact fact;

  FactWidget({Key? key, required this.fact, this.onReload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: _config.uiWidthPx * 1,
          height: _config.uiHeightPx * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(loadNonCachedImage(catImageUrl)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: _config.uiWidthPx * 1,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.4),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: _config.uiWidthPx * 0.8,
                    height: _config.uiHeightPx * 0.3,
                    child: ZoomIn(
                      child: AutoSizeText(
                        fact.text,
                        minFontSize: 10,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ZoomIn(
                    child: Text(
                      formatDateTime(fact.createdAt),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: _config.uiHeightPx * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HistoryScreen.routeName);
                        },
                        text: easy.tr('View History'),
                      ),
                      AppButton(
                        iconButton:
                            const IconData(0xe514, fontFamily: 'MaterialIcons'),
                        borderRadius: 50,
                        onPressed: () {
                          onReload?.call();
                        },
                        text: easy.tr('Reload'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
