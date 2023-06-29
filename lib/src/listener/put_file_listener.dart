class OnPutFileListener {
  Function(String putID, String hash, int total)? onHashComplete;
  Function(String putID, int current, int total)? onHashProgress;
  Function(String putID, int size)? onOpen;
  Function(String putID, int total, int putType)? onPutComplete;
  Function(String putID, int save, int current, int total)? onPutProgress;
  Function(String putID, int current, int total)? onPutStart;

  void hashComplete(String putID, String hash, int total) {
    onHashComplete?.call(putID, hash, total);
  }

  void hashProgress(String putID, int current, int total) {
    onHashProgress?.call(putID, current, total);
  }

  void open(String putID, int size) {
    onOpen?.call(putID, size);
  }

  void putComplete(String putID, int total, int putType) {
    onPutComplete?.call(putID, total, putType);
  }

  void putProgress(String putID, int save, int current, int total) {
    onPutProgress?.call(putID, save, current, total);
  }

  void putStart(String putID, int current, int total) {
    onPutStart?.call(putID, current, total);
  }
}
