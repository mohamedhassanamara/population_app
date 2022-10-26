
import 'package:shared_preferences/shared_preferences.dart';

class Favorites{

  void initial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('favorite'))
      prefs.setStringList('favorite',[]);

  }
  void changeFavorite(String string) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorite')?? [];
    if(favorites.contains(string)){
      favorites.remove(string);
    } else{
      favorites.add(string);
    }
    print(favorites);
    prefs.setStringList('favorite', favorites);

  }


  void displayFavorites() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('isFavorite'))
      prefs.setBool('isFavorite', prefs.getBool('isFavorite')?? false);
    else
      prefs.setBool('isFavorite', true);
  }
}