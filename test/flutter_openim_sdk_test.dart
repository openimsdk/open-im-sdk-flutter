import 'package:flutter/services.dart';
import 'package:flutter_openim_sdk/models/message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';

void main() {
  /* const MethodChannel channel = MethodChannel('flutter_openim_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {});*/

  Message m1= new Message(clientMsgID: '1',content: 'c1');
  Message m2= new Message(clientMsgID: '2',content: 'c2');
  Message m3= new Message(clientMsgID: '3',content: 'c3');
  Message m4= new Message(clientMsgID: '3',content: 'c4');
  List list = List.of([m1,m2,m3]);


  print(list.contains(m4));
  print(m1==m4);
  print(m2==m4);
  print(m3==m4);
}
