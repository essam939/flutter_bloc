import 'package:bblocex/data/web_api/api.dart';
import 'package:bblocex/presentations/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bussiness_logic/characters_cubit.dart';
import 'constans/strings.dart';
import 'data/repository/charater_repo.dart';

class AppRoute {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRoute(){
    charactersRepository=CharactersRepository(Api());
    charactersCubit=CharactersCubit(charactersRepository);
  }
  Route? generateAppRoutes(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return  MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharacterScreen(),
          ),
        );
    }
  }
}
