import 'package:animation_list/animation_list.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:proarea_assignment/config/sizeConfig/size_config.dart';

import '../../../models/fact.dart';
import '../../../utils/colors.dart';
import '../../../utils/helpers.dart';
import '../widget/app_bar.dart';
import '../widget/app_divider.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = 'history';

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final SizeConfig _config = SizeConfig();

  Future<List<Fact>> _getFactHistory() async {
    final box = await Hive.openBox<Fact>('fact');
    final factList = box.values.toList();
    return factList.cast<Fact>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: easy.tr('Fact History'), showBackButton: true),
      body: FutureBuilder<List<Fact>>(
        future: _getFactHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final factList = snapshot.data!;
            if (factList.isEmpty) {
              return Center(
                child: Text(
                  easy.tr('No facts saved yet'),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColor.PRIMARY_500),
                ),
              );
            } else {
              return makeList(factList, context);
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(easy.tr('Error occurred while fetching facts')),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget makeList(List<Fact> factList, BuildContext context) {
    return AnimationList(duration: 1500, reBounceDepth: 20, children: [
      SizedBox(
        height: _config.uiHeightPx * 1,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              const AppDivider(color: AppColor.PRIMARY_500),
          shrinkWrap: false,
          dragStartBehavior: DragStartBehavior.down,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: factList.length,
          itemBuilder: (context, index) {
            final fact = factList[index];
            return Column(
              children: [
                ListTile(
                  tileColor: AppColor.LM_BACKGROUND_BASIC,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1.0,
                          color: Colors.white24,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.history_outlined,
                      size: 16,
                      color: AppColor.PRIMARY_500,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: AutoSizeText(
                      fact.text,
                      maxLines: 4,
                      minFontSize: 9,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColor.PRIMARY_500),
                    ),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text(
                          formatDateTime(fact.createdAt),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColor.PRIMARY_500,
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ]);
  }
}
