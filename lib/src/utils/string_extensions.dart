extension StringExtension on String {
  String toTitleCase() {
    final arr = replaceAll('_', ' ').split(' ');
    var str = '';
    arr.removeWhere((e) => e.isEmpty);
    for (var i in arr) {
      str += arr[arr.indexOf(i)][0].toUpperCase() +
          arr[arr.indexOf(i)].substring(1);
      if (i != arr.last) {
        str += ' ';
      }
    }
    return str;
  }
}
