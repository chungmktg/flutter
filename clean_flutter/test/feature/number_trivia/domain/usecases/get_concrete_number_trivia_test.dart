import 'package:clean_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_flutter/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_flutter/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRespository extends Mock implements NumberTriviaRepository{}

void main(){
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRespository mockNumberTriviaRespository;

  setUp((){
    mockNumberTriviaRespository = MockNumberTriviaRespository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRespository);
  });
  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test('should get triva from the repository', () async {
    when(mockNumberTriviaRespository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    final result = await usecase.execute(number: tNumber);
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRespository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRespository);
  });

}