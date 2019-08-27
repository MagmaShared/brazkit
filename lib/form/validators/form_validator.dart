
class BrazFormValidatorKit {

  static String validateEmail(String text) {

    if (text.isEmpty) return "Informe o email";
    if (text.length < 7) return "Email inválido.";
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)) return "Email inválido.";

    return null;
  }

  static String validatePassword(String text) {

    if (text.isEmpty) return "Informe a senha";
    if (text.length <= 5) return "Senha precisa ter mais de 5 caracteres";

    // TODO fazer mais validações

    return null;
  }

  static String validateName(String text) {
    if (text.isEmpty) return "Informe o nome";
    return null;
  }

}



