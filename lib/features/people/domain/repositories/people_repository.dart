import '../../../../core/network/api_result.dart';
import '../models/person.dart';

abstract class PeopleRepository {
  Future<ApiResult<List<Person>>> getPopularPeople({int page = 1});
  Future<ApiResult<PersonDetails>> getPersonDetails(int id);
}
