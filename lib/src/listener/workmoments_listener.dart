class OnWorkMomentsListener {
  Function()? onRecvNewNotification;

  OnWorkMomentsListener({this.onRecvNewNotification});

  void recvNewNotification() {
    onRecvNewNotification?.call();
  }
}
