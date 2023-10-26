abstract class Parameters {}

class ApiMethodParameter extends Parameters {
  final String apiMethod;

  ApiMethodParameter({required this.apiMethod});
}

class GetOneById extends Parameters {
  final int id;

  GetOneById({required this.id});
}
