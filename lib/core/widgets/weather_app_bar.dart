import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../utils/constants.dart';

class WeatherAppBar extends StatelessWidget with PreferredSizeWidget {
  const WeatherAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.SETTINGS_SCREEN),
          splashRadius: smallIconSize,
          icon: Icon(Icons.settings, size: smallIconSize,),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class WeatherBackAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  const WeatherBackAppBar({
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(
        title!,
        style: Get.textTheme.headline2?.copyWith(color: Get.theme.indicatorColor),
      ) : null,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Get.back(),
        splashRadius: smallIconSize,
        icon: Icon(Icons.arrow_back_ios_new, size: smallIconSize, color: Get.theme.indicatorColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
