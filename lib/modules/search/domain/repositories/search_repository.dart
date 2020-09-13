import 'package:dartz/dartz.dart';
import 'package:github_search/modules/search/domain/entities/result_search.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureException, List<ResultSearch>>> search(
      String searchText);
}
