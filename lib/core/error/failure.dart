class Failure {
  final String message;

  Failure([this.message = "An unexpected error occure"]);
}

class CacheFailure extends Failure {
  CacheFailure()
      : super(
          'Data tidak ditemukan di cache',
        );
}
