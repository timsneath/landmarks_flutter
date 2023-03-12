class Range<T extends num> {
  final T from;
  final T to;

  T get magnitude => to - from as T;

  Range(this.from, this.to);

  factory Range.fromList(List<T> list) {
    assert(list.length == 2);
    return Range(list.first, list.last);
  }
}

extension RangeOfRanges<T extends num> on Iterable<Range<T>> {
  Range<T> range() {
    final min = (map((range) => range.from).toList()..sort()).first;
    final max = (map((range) => range.to).toList()..sort()).last;

    return Range<T>(min, max);
  }
}
