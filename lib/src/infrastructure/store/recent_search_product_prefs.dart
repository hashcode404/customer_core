import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchProductPrefs {
  static const String prefKey = 'recent_searches';

  /// Read searches from SharedPreferences
  static Future<List<String>> readSearch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(prefKey) ?? [];
  }

  /// Save a new search term
  static Future<void> saveSearch(String search) async {
    if (search.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    List<String> searches = prefs.getStringList(prefKey) ?? [];

    // Remove if already exists to avoid duplicates
    searches.remove(search);
    searches.insert(0, search); // Add at top

    // Keep only last 10 searches
    if (searches.length > 10) {
      searches = searches.sublist(0, 10);
    }

    await prefs.setStringList(prefKey, searches);
  }

  /// Clear all searches
  static Future<void> clearSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(prefKey);
  }
}
