class OnCustomBusinessListener {
  Function(String s)? onRecvCustomBusinessMessage;

  OnCustomBusinessListener({this.onRecvCustomBusinessMessage});

  void recvCustomBusinessMessage(String s) {
    onRecvCustomBusinessMessage?.call(s);
  }
}
