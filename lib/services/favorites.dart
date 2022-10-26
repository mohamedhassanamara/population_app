
import 'package:shared_preferences/shared_preferences.dart';

class Favorites{

  static void initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('favorite'))
      prefs.setStringList('favorite',[]);

  }

  static void changeFavorite(String string) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorite')?? [];
    if(favorites.contains(string)){
      favorites.remove(string);
    } else{
      favorites.add(string);
    }
    prefs.setStringList('favorite', favorites);

  }
}