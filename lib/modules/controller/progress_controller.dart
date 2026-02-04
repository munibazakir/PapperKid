import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ModuleType { abc, counting }

enum LevelType { basic, medium, advance, elite }

class ProgressController extends GetxController {
  final SharedPreferences prefs;

  ProgressController(this.prefs); // constructor with prefs

  // Last index
  int getLastIndex(ModuleType module, LevelType level) {
    return prefs.getInt("${module.name}_${level.name}_lastIndex") ?? 0;
  }

  void saveLastIndex(ModuleType module, LevelType level, int index) {
    prefs.setInt("${module.name}_${level.name}_lastIndex", index);
  }

  // Unlocked level
  int getUnlockedLevel(ModuleType module) {
    return prefs.getInt("${module.name}_unlocked") ?? 0;
  }

  void setUnlockedLevel(ModuleType module, int levelIndex) {
    prefs.setInt("${module.name}_unlocked", levelIndex);
  }

  // Medium level last index
  int getLastIndexMedium() {
    return prefs.getInt("abc_medium_lastIndex") ?? 0;
  }

  void saveLastIndexMedium(int index) {
    prefs.setInt("abc_medium_lastIndex", index);
  }

  // Medium level unlock
  int getUnlockedMediumLevel() {
    return prefs.getInt("abc_medium_unlocked") ?? 0;
  }

  void setUnlockedMediumLevel(int value) {
    prefs.setInt("abc_medium_unlocked", value);
  }

  // Advance level last index
  int getLastIndexAdvance() {
    return prefs.getInt("abc_advance_lastIndex") ?? 0;
  }

  void saveLastIndexAdvance(int index) {
    prefs.setInt("abc_advance_lastIndex", index);
  }

  // Advance level unlock
  int getUnlockedAdvanceLevel() {
    return prefs.getInt("abc_advance_unlocked") ?? 0;
  }

  void setUnlockedAdvanceLevel(int value) {
    prefs.setInt("abc_advance_unlocked", value);
  }
}
