enum Country {
  ind(
    decimalPlaces: 2,
    currencyCode: 'INR',
    symbol: '₹',
    countryName: 'India',
  ),
  uk(
    decimalPlaces: 2,
    currencyCode: 'GBP',
    symbol: '£',
    countryName: 'United Kingdom',
  ),
  bh(
    decimalPlaces: 3,
    currencyCode: 'BHD',
    symbol: 'BH',
    countryName: 'Bahrain',
  );

  final int decimalPlaces;
  final String currencyCode;
  final String symbol;
  final String countryName;

  const Country({
    required this.decimalPlaces,
    required this.currencyCode,
    required this.symbol,
    required this.countryName,
  });
}