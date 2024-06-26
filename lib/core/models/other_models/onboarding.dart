import 'package:flutter/material.dart';

import '../../services/localization_service.dart';

class Onboarding {
  late String? imgUrl;
  late String? title;

  Onboarding(this.imgUrl, this.title);

  Onboarding.fromJson(json) {
    debugPrint('$json');
    title = json[LocalizationService.getLocalizedKey('title')];
    imgUrl = json['image_url'];
  }
}
