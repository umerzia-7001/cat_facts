import '../models/fact.dart';
import 'fact_api_provider.dart';

class FactRepository {
  final FactApiProvider _apiProvider;

  FactRepository({required dio}) : _apiProvider = FactApiProvider(dio);

  Future<Fact> getRandomFact() async {
    try {
      return await _apiProvider.getFact();
    } catch (e) {
      throw Exception('Failed to fetch random fact');
    }
  }

  Future<Fact> getRandomCatImage() async {
    try {
      return await _apiProvider.geCatImage();
    } catch (e) {
      throw Exception('Failed to get random cat image');
    }
  }
}
