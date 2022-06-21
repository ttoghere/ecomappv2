import 'package:flutter/material.dart';

import '../../management/management_shelf.dart';


class UndefinedRoute extends StatelessWidget {
  const UndefinedRoute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.noPage),
      ),
      body: Center(
        child: Text(
          StringManager.noPage,
          style: getRegularStyle(color: ColorManager.error),
        ),
      ),
    );
  }
}
