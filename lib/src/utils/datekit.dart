class DateKit {

  static List<String> monthsNames = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  static String getFormattedDateFromMillisecondsSinceEpoch(int dueDate) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dueDate);
    return "${date.day} de ${monthsNames[date.month - 1]}";
  }
}
