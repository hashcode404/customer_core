import 'package:customer_core/customer_core.dart';
import 'package:customer_core/src/core/config/app_env.dart';

class AppIdentifiers {
  static String kApplicationName = AppConfig.instance.applicationName;

  static String kShopName = AppConfig.instance.shopName;

  // static const String kShopId = '44';

  // static String kShopIdentifier = 'silver-spoons';

  static   String kProdShopId = AppConfig.instance.shopId;

  static const String kDevShopId = '1';

  static String kDevShopIdentifier = 'le-arabia';

  static String kProdShopIdentifier = AppConfig.instance.shopIdentifier;

  static String get kShopIdentifier {
    return AppEnvironment.current == AppEnv.dev
        ? kDevShopIdentifier
        : kProdShopIdentifier;
  }

  static String get kShopId {
    return AppEnvironment.current == AppEnv.dev ? kDevShopId : kProdShopId;
  }

  static String kShopInfoEmail = AppConfig.instance.shopInfoEmail;

  static List<String> kShopInfoPh = AppConfig.instance.shopInfoPhone;

  static String kShopInfoAddress = AppConfig.instance.shopInfoAddress;

  static String kBuildIdentifier = AppConfig.instance.buildIdentifier;

//IMPORTANT: Add the firebase project id here
  static String kProjectID = AppConfig.instance.fireBaseProjectId;

  static String kFCMTopicID = AppConfig.instance.fcmTopicId ?? 'FPON_FTK_';
}
