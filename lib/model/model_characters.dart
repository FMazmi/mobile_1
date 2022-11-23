class CharactersDataModel {
  List<CharactersData>? characters;
  CharactersDataModel({this.characters});
  CharactersDataModel.fromJson(List<dynamic> json) {
    if (json != null) {
      characters = <CharactersData>[];
      json.forEach((v) {
        characters!.add(new CharactersData.fromJson(v));
      });
    }
  }

  // get name => null;

  // get price => null;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.characters != null) {
      data['*'] = this.characters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CharactersData {
  String? name;
  List<dynamic>? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  int? yearOfBirth;
  // bool? wizard;
  String? ancestry;
  String? eyeColour;
  String? hairColour;
  Wand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List<dynamic>? alternateActors;
  bool? alive;
  String? image;

  CharactersData({
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    // this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  });

  CharactersData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alternateNames = json['alternate_names'];
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    yearOfBirth = json['yearOfBirth'];
    // wizard = json['wizard'] as bool?;
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    alternateActors = json['alternate_actors'];
    alive = json['alive'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['alternate_names'] = alternateNames;
    json['species'] = species;
    json['gender'] = gender;
    json['house'] = house;
    json['dateOfBirth'] = dateOfBirth;
    json['yearOfBirth'] = yearOfBirth;
    json['ancestry'] = ancestry;
    json['eyeColour'] = eyeColour;
    json['hairColour'] = hairColour;
    json['patronus'] = patronus;
    json['hogwartsStudent'] = hogwartsStudent;
    json['hogwartsStaff'] = hogwartsStaff;
    json['actor'] = actor;
    json['alternate_actors'] = alternateActors;
    json['alive'] = alive;
    json['image'] = image;
    return json;
  }
}

class Wand {
  String? wood;
  String? core;
  int? length;

  Wand({
    this.wood,
    this.core,
    this.length,
  });

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'] as String?;
    core = json['core'] as String?;
    length = json['length'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['wood'] = wood;
    json['core'] = core;
    json['length'] = length;
    return json;
  }
}
