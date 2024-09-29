class OnUploadLogsListener {
  Function(int current, int size)? onUploadProgress;
  OnUploadLogsListener({this.onUploadProgress});

  void onProgress(int current, int size) {
    onUploadProgress?.call(current, size);
  }
}

class OnUploadFileListener {
  OnUploadFileListener({
    this.onComplete,
    this.onHashPartComplete,
    this.onHashPartProgress,
    this.onOpen,
    this.onPartSize,
    this.onUploadID,
    this.onUploadPartComplete,
    this.onUploadProgress,
  });

  Function(String id, int size, String url, int type)? onComplete;
  Function(String id, String partHash, String fileHash)? onHashPartComplete;
  Function(String id, int index, int size, String partHash)? onHashPartProgress;
  Function(String id, int size)? onOpen;
  Function(String id, int partSize, int num)? onPartSize;
  Function(String id, int fileSize, int streamSize, int storageSize)? onUploadProgress;
  Function(String id, String uploadID)? onUploadID;
  Function(String id, int index, int partSize, String partHash)? onUploadPartComplete;

  void complete(String id, int size, String url, int type) {
    onComplete?.call(id, size, url, type);
  }

  void hashPartComplete(String id, String partHash, String fileHash) {
    onHashPartComplete?.call(id, partHash, fileHash);
  }

  void hashPartProgress(String id, int index, int size, String partHash) {
    onHashPartProgress?.call(id, index, size, partHash);
  }

  void open(String id, int size) {
    onOpen?.call(id, size);
  }

  void partSize(String id, int partSize, int num) {
    onPartSize?.call(id, partSize, num);
  }

  void uploadProgress(String id, int fileSize, int streamSize, int storageSize) {
    onUploadProgress?.call(id, fileSize, streamSize, storageSize);
  }

  void uploadID(String id, String uploadID) {
    onUploadID?.call(id, uploadID);
  }

  void uploadPartComplete(String id, int index, int partSize, String partHash) {
    onUploadPartComplete?.call(id, index, partSize, partHash);
  }
}
