class Character{
  late int charId;
  late String name;
  late String nikName;
  late String image;
  late List<dynamic> jobs;
  late String statesIfDeadOrAlive;
  late List<dynamic> apperanceOfSeasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulApperance;
  Character.fromJson(Map<String,dynamic> json){
    charId=json["char_id"];
    name=json["name"];
    nikName=json["nickname"];
    image=json[ "img"];
    jobs=json["appearance"];
    statesIfDeadOrAlive=json["status"];
    apperanceOfSeasons=json["appearance"];
    actorName=json[ "portrayed"];
    categoryForTwoSeries=json["category"];
    betterCallSaulApperance=json["better_call_saul_appearance"];
  }
}