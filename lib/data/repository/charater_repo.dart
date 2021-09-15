import 'package:bblocex/data/model/character.dart';
import 'package:bblocex/data/web_api/api.dart';

class CharactersRepository{
  final Api api;
  CharactersRepository(this.api);
  Future<List<Character>> getAllCharacters() async {
    final characters=await api.getAllCharacters();
    return characters.map((character)=>Character.fromJson(character)).toList();
  }
}