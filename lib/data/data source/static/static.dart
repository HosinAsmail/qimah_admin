import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/data/model/onboarding_model.dart';
import 'package:qimah_admin/generated/l10n.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: S.current.onboarding_title_page_one,
      body: S.current.onboarding_body_page_one,
      image: Assets.assetsImagesConvert),
  OnBoardingModel(
      title: S.current.onboarding_title_page_two,
      body: S.current.onboarding_body_page_two,
      image: Assets.assetsImagesConvert),
  OnBoardingModel(
      title: S.current.onboarding_title_page_three,
      body: S.current.onboarding_body_page_three,
      image: Assets.assetsImagesConvert),
];
