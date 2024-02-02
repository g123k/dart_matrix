class Matrix2<T> {
  final List<List<T?>> _matrix;

  Matrix2({required int columns, required int rows})
      : assert(columns >= 0),
        assert(rows >= 0),
        _matrix = _initMatrix(columns, rows);

  static List<List<T?>> _initMatrix<T>(int columns, int rows) {
    return List<List<T?>>.generate(
      columns,
      (int index) => List<T?>.generate(
        rows,
        (int index) {
          return null;
        },
      ),
    );
  }

  void set(int x, int y, T? value) {
    if (x < 0 || x > columns || y < 0 || y > rows) {
      throw Exception('This position doesn\'t exist!');
    }

    _matrix[x][y] = value;
  }

  int get columns => _matrix.length;

  int get rows => _matrix.isNotEmpty ? _matrix.first.length : 0;

  bool isSquared() => columns == rows;

  @override
  String toString() {
    StringBuffer sb = StringBuffer();

    for (List<T?> column in _matrix) {
      if (sb.isNotEmpty) {
        sb.writeln();
      }

      sb.write('[');
      sb.write(column.map((T? el) => el ?? '-').join(', '));
      sb.write(']');
    }

    return sb.toString();
  }
}

class SquareMatrix<T> extends Matrix2<T> {
  SquareMatrix({required int size}) : super(columns: size, rows: size);
}

class IntMatrix extends Matrix2<int> {
  IntMatrix({required super.columns, required super.rows});

  IntMatrix operator *(IntMatrix other) {
    throw UnimplementedError();
  }
}

class BooleanMatrix extends Matrix2<bool> {
  BooleanMatrix({required super.columns, required super.rows});
}
