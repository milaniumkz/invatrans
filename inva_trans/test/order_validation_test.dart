import 'package:flutter_test/flutter_test.dart';
import 'package:inva_trans/backend/order_validation.dart';

void main() {
  final today = DateTime(2026, 10, 16, 15);
  String? check(
          {String origin = 'Адрес А',
          String destination = 'Адрес Б',
          String price = '1500',
          String date = '16.10.2026',
          int type = 1,
          String floor = '',
          String weight = ''}) =>
      validateOrder(
          origin: origin,
          destination: destination,
          price: price,
          date: date,
          transportType: type,
          floor: floor,
          weight: weight,
          now: today);

  test('Valid order allows today, future dates and local decimal weight', () {
    expect(check(weight: '75,5'), isNull);
    expect(check(date: '20.10.2026', type: 3, price: '0'), isNull);
  });
  test('Transport, addresses and price must be valid', () {
    expect(check(type: 0), isNotNull);
    expect(check(type: 4), isNotNull);
    expect(check(origin: ' '), isNotNull);
    expect(check(destination: ''), isNotNull);
    expect(check(price: '-1'), isNotNull);
    expect(check(price: 'сто'), isNotNull);
  });
  test('Dates cannot silently roll over or be in the past', () {
    expect(check(date: '31.02.2027'), isNotNull);
    expect(check(date: '15.10.2026'), isNotNull);
    expect(check(date: ''), isNotNull);
    expect(parsePickupDate('20.10.2026'), DateTime(2026, 10, 20));
  });
  test('Invalid floor and non-finite weight are rejected', () {
    expect(check(floor: '1.5'), isNotNull);
    expect(check(weight: 'NaN'), isNotNull);
    expect(check(weight: 'Infinity'), isNotNull);
    expect(check(weight: '-70'), isNotNull);
  });
}
