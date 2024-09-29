class InitConfig {
  String systemType;
  int platformID;
  String apiAddr;
  String wsAddr;
  String dataDir;
  int logLevel;
  bool isLogStandardOutput;
  String? logFilePath;
  bool enabledCompression;

  InitConfig({
    required this.platformID,
    required this.apiAddr,
    required this.wsAddr,
    required this.dataDir,
    this.logLevel = 6,
    this.isLogStandardOutput = true,
    this.logFilePath,
    this.enabledCompression = false,
    this.systemType = 'flutter',
  });

  factory InitConfig.fromJson(Map<String, dynamic> json) {
    return InitConfig(
        platformID: json['platformID'],
        apiAddr: json['apiAddr'],
        wsAddr: json['wsAddr'],
        dataDir: json['dataDir'],
        logLevel: json['logLevel'],
        isLogStandardOutput: json['isLogStandardOutput'],
        logFilePath: json['logFilePath'],
        enabledCompression: json['isCompression'],
        systemType: json['systemType']);
  }

  Map<String, dynamic> toMap() {
    return {
      'platformID': platformID,
      'apiAddr': apiAddr,
      'wsAddr': wsAddr,
      'dataDir': dataDir,
      'logLevel': logLevel,
      'isLogStandardOutput': isLogStandardOutput,
      'logFilePath': logFilePath,
      'isCompression': enabledCompression,
      'systemType': systemType,
    };
  }
}
