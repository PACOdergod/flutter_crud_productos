import 'dart:async';

class Validator {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Minimo 6 caracteres');
      }
    },
  );
}
