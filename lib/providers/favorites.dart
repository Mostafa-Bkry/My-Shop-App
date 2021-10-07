import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const preferencesKey = 'favorites';

class FavoritesState extends ChangeNotifier {
  SharedPreferences preferences;
  List<int> ids;

  FavoritesState(this.preferences)
      : ids = preferences
                .getStringList(preferencesKey)
                ?.map(int.parse)
                .toList() ??
            [];

  @override
  void notifyListeners() {
    preferences.setStringList(
        preferencesKey, ids.map((id) => id.toString()).toList());
    super.notifyListeners();
  }

  void toggle(int id) {
    var index = ids.indexOf(id);

    if (index == -1) {
      ids.add(id);
    } else {
      ids.removeAt(index);
    }
    notifyListeners();
  }

  void reorder(int oldIndex, int newIndex) {
    var id = ids.removeAt(oldIndex);
    if (newIndex > oldIndex) newIndex -= 1;
    ids.insert(newIndex, id);
    notifyListeners();
  }
}
