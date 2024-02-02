class Matrix {
  final List<List<int?>> _matrix;

  Matrix({required int columns, required int rows})
      : assert(columns >= 0),
        assert(rows >= 0),
        _matrix = _initMatrix(columns, rows);

  static List<List<int?>> _initMatrix(int columns, int rows) {
    return List<List<int?>>.generate(
      columns,
      (int index) => List<int?>.generate(
        rows,
        (int index) {
          return null;
        },
      ),
    );
  }

  void set(int x, int y, int? value) {
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

    for (List<int?> column in _matrix) {
      if (sb.isNotEmpty) {
        sb.writeln();
      }

      sb.write('[');
      sb.write(column.map((int? el) => el ?? '-').join(', '));
      sb.write(']');
    }

    return sb.toString();
  }
}

class SquareMatrix extends Matrix {
  SquareMatrix({required int size}) : super(columns: size, rows: size);
}
