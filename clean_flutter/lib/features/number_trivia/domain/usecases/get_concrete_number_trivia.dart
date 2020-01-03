import 'package:clean_flutter/core/error/failures.dart';
import 'package:clean_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_flutter/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetConcreteNumberTrivia{
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute({
  @required int number
}) async {
    return repository.getConcreteNumberTrivia(number);
  }
}