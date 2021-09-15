import 'package:bblocex/bussiness_logic/characters_cubit.dart';
import 'package:bblocex/constans/my_colors.dart';
import 'package:bblocex/data/model/character.dart';
import 'package:bblocex/presentations/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  Widget buildBlocwidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(
      builder: (context,state){
        if(state is CharactersLoaded){
          allCharacters=(state).characters;
         return buildListWidgets();
        }
        else{
          return ShowLoadingIndecator();
        }
      },
    );
  }
  Widget buildListWidgets(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(
          children: [
            buildCharactersList()
          ],
        ),
      ),
    );
  }
  Widget buildCharactersList(){
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
    childAspectRatio: 2/3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
    ),  shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount:_searchTextController.text.isEmpty?allCharacters.length:searchedForCharacters.length, itemBuilder: (context,index){
      return   CharacterItem(character:_searchTextController.text.isEmpty?allCharacters[index]:searchedForCharacters[index],);
        });
  }
  Widget ShowLoadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
Widget BuildTitleAppBar(){
    return  Text(
      "mohamed",
      style: TextStyle(color: MyColors.myGray),
    );
}
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGray,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGray, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGray, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }
  void addSearchedFOrItemsToSearchedList(String  searchedCharacter){
    searchedForCharacters=allCharacters.where((element) => element.name.toLowerCase().startsWith(searchedCharacter)).toList();
    setState(() {

    });
  }
  List<Widget>_buildAppBarActions(){
    if(_isSearching){
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: MyColors.myGray),
        ),
      ];
    }
    else{
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: MyColors.myGray,
          ),
        ),
      ];
    }
  }
  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }
  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title:_isSearching? _buildSearchField():BuildTitleAppBar(),
        actions: _buildAppBarActions(),
        leading: _isSearching?BackButton(
          color: MyColors.myGray,
        ):Container(),
      ),
      body: buildBlocwidget(),
    );
  }
}
