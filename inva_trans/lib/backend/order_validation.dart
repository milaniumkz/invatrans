import 'package:intl/intl.dart';

DateTime? parsePickupDate(String value) {
  try {
    return DateFormat('dd.MM.yyyy').parseStrict(value.trim());
  } on FormatException {
    return null;
  }
}

String? validateOrder(
    {required String origin,
    required String destination,
    required String price,
    required String date,
    required int transportType,
    String floor = '',
    String weight = '',
    DateTime? now}) {
  if (transportType < 1 || transportType > 3) return 'Выберите тип перевозки';
  if (origin.trim().isEmpty || destination.trim().isEmpty) {
    return 'Укажите, откуда и куда ехать';
  }
  final amount = int.tryParse(price.trim());
  if (amount == null || amount < 0) return 'Укажите корректную цену';
  final pickup = parsePickupDate(date);
  final today = now ?? DateTime.now();
  if (pickup == null ||
      pickup.isBefore(DateTime(today.year, today.month, today.day))) {
    return 'Укажите дату поездки в формате ДД.ММ.ГГГГ, не раньше сегодняшней';
  }
  if (floor.trim().isNotEmpty && int.tryParse(floor.trim()) == null) {
    return 'Укажите этаж целым числом';
  }
  if (weight.trim().isNotEmpty) {
    final kilograms = double.tryParse(weight.trim().replaceAll(',', '.'));
    if (kilograms == null || !kilograms.isFinite || kilograms <= 0) {
      return 'Укажите корректный вес';
    }
  }
  return null;
}
