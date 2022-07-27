extension ListExtensions<T> on List<T?> {
  ////The list `MUST` have an `id` property
  T? getById(int? id) => any((element) => (element as dynamic).id == id)
      ? firstWhere((element) => (element as dynamic).id == id)
      : null;

  bool addOrRepLace(dynamic obj) {
    try {
      final currentIndex =
          (this as dynamic).indexWhere((element) => element.id == obj.id);
      if (currentIndex == -1) {
        add(obj as T);
      } else {
        removeById(obj.id as int?);
        insert(currentIndex as int, obj as T);
      }
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  bool addOrRemove(dynamic obj) {
    try {
      final currentIndex =
          (this as dynamic).indexWhere((element) => element.id == obj.id);
      if (currentIndex == -1) {
        add(obj as T);
      } else {
        removeById(obj.id as int?);
      }
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  void removeById(int? id) =>
      (this as dynamic).removeWhere((element) => element.id == id);
}
