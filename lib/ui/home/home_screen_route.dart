import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:toy_flutter/ui/home/home_screen.dart';

import 'home_screen_view_model.dart';

class  HomeScreenRoute extends StatelessWidget {
  const HomeScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenViewModel>(create: (_) => HomeScreenViewModel(), child: const HomeScreen());
  }
}
