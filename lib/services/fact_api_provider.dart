import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/fact.dart';

part 'fact_api_provider.g.dart';

@RestApi(baseUrl: 'https://')
abstract class FactApiProvider {
  factory FactApiProvider(Dio dio, {String baseUrl}) = _FactApiProvider;

  @GET('cat-fact.herokuapp.com/facts/random')
  Future<Fact> getFact();

  @GET('cataas.com/cat')
  Future<Fact> geCatImage();
}
