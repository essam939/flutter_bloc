import 'package:bblocex/data/model/character.dart';
import 'package:bblocex/data/repository/charater_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters=[];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  Future<List<Character>> getAllCharacters() async {
    charactersRepository.getAllCharacters().then((characters){
      emit(CharactersLoaded(characters));
      this.characters=characters;
    });
    return characters;
  }
}
