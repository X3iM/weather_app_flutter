abstract class Storage<T> {
  Future init();
  List<T> getData();
  Future addData(T data);
  Future delete(T data);
  bool containData(T data);
  void close();
}