//  login   exceptions
class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

//  register escpetions
class WeakPasswordException implements Exception {}

class EmailAlreadyInUseException implements Exception {}

class InvalidEmailException implements Exception {}

//  generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInException implements Exception {}
