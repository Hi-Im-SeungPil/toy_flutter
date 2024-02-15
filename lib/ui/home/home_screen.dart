import 'package:flutter/material.dart';
import 'package:toy_flutter/ui/home/home_screen_holder.dart';
import '../../strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var homeScreenHolder = HomeScreenHolder(context: context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(Strings.loginScreenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "화폐 단위를 입력해 주세요.",
                  ),
                  controller: homeScreenHolder.currencyUnitTextController,
                )),
            TextButton(
                onPressed: () {
                  homeScreenHolder.getCurrencyRateButtonListener();
                },
                child: Text("환율 가져오기")),
            // Consumer<HomeScreenViewModel>(builder: (context, provider, child) {
            //   return
        Text(homeScreenHolder.getCurrencyText()),
            // }),
            TextButton(
                onPressed: () {
                  homeScreenHolder.saveCurrencyLog();
                },
                child: Text("현재 정보 저장")),
            TextButton(
                onPressed: () {
                  homeScreenHolder.showCurrencyLog();
                },
                child: Text("저장된 정보 보기"))
          ],
        ),
      ),
    );
  }
}
