import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'alphabet_enum.dart';

class ProgressController extends GetxController {
  final SharedPreferences prefs;

  ProgressController(this.prefs);

  int getLastIndex(AlphabetLevel level) {
    return prefs.getInt('alphabet_${level.name}_lastIndex') ?? 0;
  }

  int getCompleted(AlphabetLevel level) {
    return prefs.getInt('alphabet_${level.name}_completed') ?? 0;
  }

  void saveProgress({required AlphabetLevel level, required int index}) {
    prefs.setInt('alphabet_${level.name}_lastIndex', index);
    // Optional: update completed count
    // prefs.setInt('alphabet_${level.name}_completed', getCompleted(level) + 1);
  }
}
