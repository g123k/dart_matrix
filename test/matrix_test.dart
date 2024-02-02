import 'dart:math';

import 'package:matrix/matrix.dart';
import 'package:test/test.dart';

void main() {
  group('Matrix', () {
    test('Valid args', () {
      expect(() => Matrix(columns: 5, rows: 5), returnsNormally);
      expect(
        () => Matrix(columns: -1, rows: 5),
        throwsA(isA<AssertionError>()),
      );
      expect(
          Matrix(columns: 5, rows: 5).toString(),
          equals(
              '[-, -, -, -, -]\n[-, -, -, -, -]\n[-, -, -, -, -]\n[-, -, -, -, -]\n[-, -, -, -, -]'));
    });

    test('toString', () {
      expect(() => Matrix(columns: 5, rows: 5).toString(),
          isNot(startsWith('Instance of')));

      expect(() => Matrix(columns: 5, rows: 5).toString(),
          isNot(startsWith('Instance of')));
    });

    test('set(X, Y, value)', () {
      final Matrix matrix = Matrix(columns: 5, rows: 5);

      matrix.set(0, 0, 45);
      expect(matrix.toString(), startsWith('[45'));

      expect(() => matrix.set(-1, 0, 45), throwsException);
    });

    test('isSquared', () {
      expect(Matrix(columns: 5, rows: 5).isSquared(), isTrue);
      expect(Matrix(columns: 2, rows: 5).isSquared(), isFalse);
    });
  });

  group('SquareMatrix', () {
    test('Init', () {
      final SquareMatrix matrix = SquareMatrix(size: 5);
      expect(matrix.columns, 5);
      expect(matrix.rows, 5);

      matrix.set(0, 1, 5);
      expect(
          matrix.toString(),
          equals(
              '[-, 5, -, -, -]\n[-, -, -, -, -]\n[-, -, -, -, -]\n[-, -, -, -, -]\n[-, -, -, -, -]'));
    });
  });
}
