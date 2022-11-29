import 'base_network.dart';

class CharactersSource {
  static CharactersSource instance = CharactersSource();
  Future<List<dynamic>> loadCharacters() {
    return BaseNetwork.get('characters');
  }
}

class HouseSource {
  static HouseSource instance = HouseSource();
  Future<List<dynamic>> loadHouse() {
    return BaseNetwork.get('characters/house');
  }
}
