import 'package:customer_core/src/core/config/app_env.dart';

class AppIdentifiers {
  static const String kApplicationName = "Urban Spice";

  static const String kShopName = "Urban Spice";

  // static const String kShopId = '44';

  // static String kShopIdentifier = 'silver-spoons';

  static const String kProdShopId = '76';

  static const String kDevShopId = '1';

  static String kDevShopIdentifier = 'le-arabia';

  static String kProdShopIdentifier = 'urban-spice';

  static String get kShopIdentifier {
    return AppEnvironment.current == AppEnv.dev
        ? kDevShopIdentifier
        : kProdShopIdentifier;
  }

  static String get kShopId {
    return AppEnvironment.current == AppEnv.dev ? kDevShopId : kProdShopId;
  }

  static String kShopInfoEmail = 'info@urbanspicechelmsford.com';

  static List<String> kShopInfoPh = ['+44 01245939257'];

  static String kShopInfoAddress = '63 New Writtle Street, Chelmsford, CM2 0LF';

  static const String kBuildIdentifier = 'co.uk.urbanspice.app';

//IMPORTANT: Add the firebase project id here
  static const kProjectID = 'customerapp-6d5f7';

  static const String kFCMTopicID = 'FPON_FTK_';
}
