import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

/// 申请添加好友：
/// 主动申请者收到 OnFriendApplicationAdded
/// 被添加者收到 OnFriendApplicationAdded
///
/// 同意好友申请：
/// 操作者收到 OnFriendApplicationAccepted OnFriendAdded
/// 申请者收到 OnFriendApplicationAccepted OnFriendAdded
///
/// 好友拒绝申请：
/// 操作者收到 OnFriendApplicationRejected
/// 申请者收到 OnFriendApplicationRejected
///
/// 删除好友：
/// 操作者收到 OnFriendDeleted
///
/// 修改备注：
/// 操作者收到 OnFriendInfoChanged
///
/// 添加黑名单：
/// 操作者收到 OnBlacklistAdded；
///
/// 移除黑名单：
/// 操作者收到 OnBlacklistDeleted
class OnFriendshipListener extends FriendshipListener {
  Function(FriendApplicationInfo i)? onFriendApplicationAdded;
  Function(FriendApplicationInfo i)? onFriendApplicationDeleted;
  Function(FriendApplicationInfo i)? onFriendApplicationAccepted;
  Function(FriendApplicationInfo i)? onFriendApplicationRejected;
  Function(FriendInfo i)? onFriendAdded;
  Function(FriendInfo i)? onFriendDeleted;
  Function(FriendInfo i)? onFriendInfoChanged;
  Function(BlacklistInfo i)? onBlacklistAdded;
  Function(BlacklistInfo i)? onBlacklistDeleted;

  OnFriendshipListener({
    this.onBlacklistAdded,
    this.onBlacklistDeleted,
    this.onFriendAdded,
    this.onFriendApplicationAccepted,
    this.onFriendApplicationAdded,
    this.onFriendApplicationDeleted,
    this.onFriendApplicationRejected,
    this.onFriendDeleted,
    this.onFriendInfoChanged,
  });

  @override
  void blacklistAdded(BlacklistInfo u) {
    onBlacklistAdded?.call(u);
  }

  @override
  void blacklistDeleted(BlacklistInfo u) {
    onBlacklistDeleted?.call(u);
  }

  @override
  void friendAdded(FriendInfo u) {
    onFriendAdded?.call(u);
  }

  @override
  void friendApplicationAccepted(FriendApplicationInfo u) {
    onFriendApplicationAccepted?.call(u);
  }

  @override
  void friendApplicationAdded(FriendApplicationInfo u) {
    onFriendApplicationAdded?.call(u);
  }

  @override
  void friendApplicationDeleted(FriendApplicationInfo u) {
    onFriendApplicationDeleted?.call(u);
  }

  @override
  void friendApplicationRejected(FriendApplicationInfo u) {
    onFriendApplicationRejected?.call(u);
  }

  @override
  void friendDeleted(FriendInfo u) {
    onFriendDeleted?.call(u);
  }

  @override
  void friendInfoChanged(FriendInfo u) {
    onFriendInfoChanged?.call(u);
  }
}
