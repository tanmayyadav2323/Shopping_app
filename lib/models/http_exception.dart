class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() {
    return message;
    // return super.toString();
  }
}
//when we use the word implement all the functions in the class must be implemented then 
//implement is used for the interface (a class) which has abstract methods
//we can directly instantiate Exception