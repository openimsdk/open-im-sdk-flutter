/// 组织架构监听
class OnOrganizationListener {
  Function()? onOrganizationUpdated;

  OnOrganizationListener({this.onOrganizationUpdated});

  /// 组织架构有更新
  void organizationUpdated() {
    onOrganizationUpdated?.call();
  }
}
