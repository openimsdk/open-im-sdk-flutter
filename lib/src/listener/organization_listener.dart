class OnOrganizationListener {
  Function()? onOrganizationUpdated;

  OnOrganizationListener({this.onOrganizationUpdated});

  void organizationUpdated() {
    onOrganizationUpdated?.call();
  }
}
