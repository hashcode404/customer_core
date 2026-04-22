class KeyConfig {
  static late KeyConfig instance;
  final String secretKey;
  final String fpSecretKey;
  final String reservationSecretKey;
  final String stripeKey;

  KeyConfig({
    required this.secretKey,
    required this.fpSecretKey,
    required this.reservationSecretKey,
    required this.stripeKey,
  });
}
