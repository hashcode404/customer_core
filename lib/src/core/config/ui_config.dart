class UiConfig {
  static late UiConfig instance;
  final String logo;
  final String bgImage;
  final List<String> bannerImages;

  UiConfig({
    required this.logo,
    required this.bgImage,
    required this.bannerImages,
  });
}
