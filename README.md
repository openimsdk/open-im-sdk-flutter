# Flutter Client SDK for OpenIM 👨‍💻💬

Use this SDK to add instant messaging capabilities to your Flutter app. By connecting to a self-hosted [OpenIM](https://www.openim.online/) server, you can quickly integrate instant messaging capabilities into your app with just a few lines of code.


The underlying SDK core is implemented in [OpenIM SDK Core](https://github.com/openimsdk/openim-sdk-core). Using [gomobile](https://github.com/golang/mobile), it can be compiled into an AAR file for Android integration. Android interacts with the [OpenIM SDK Core](https://github.com/openimsdk/openim-sdk-core) through JSON, and the SDK exposes a re-encapsulated API for easy usage. In terms of data storage, Android utilizes the SQLite layer provided internally by the [OpenIM SDK Core](https://github.com/openimsdk/openim-sdk-core).

The underlying SDK core is implemented in [OpenIM SDK Core](https://github.com/openimsdk/openim-sdk-core). Using [gomobile](https://github.com/golang/mobile), it can be compiled into an XCFramework for iOS integration. iOS interacts with the [OpenIM SDK Core](https://github.com/openimsdk/openim-sdk-core) through JSON, and the SDK exposes a re-encapsulated API for easy usage. In terms of data storage, iOS utilizes the SQLite layer provided internally by the [OpenIM SDK Core](https://github.com/openimsdk/openim-sdk-core).

Based on the above AAR and XCFramework packages, the IM SDK for Flutter is encapsulated through the Flutter plug-in.

## Documentation 📚

Visit [https://docs.openim.io/](https://docs.openim.io/) for detailed documentation and guides.

For the SDK reference, see [https://docs.openim.io/sdks/quickstart/flutter](https://docs.openim.io/sdks/quickstart/flutter).

## Installation 💻
### Adding Dependencies
```dart
  flutter_openim_sdk: lastest
```

## Usage 🚀

The following examples demonstrate how to use the SDK.
### Importing the SDK

```dart
import 'package:flutter_openim_sdk/flutter_openim_sdk.dart';
```
### Initialize
```
final success = await OpenIM.iMManager.initSDK(
  platform: 0,   // Platform, referring to the IMPlatform class.
  apiAddr: "",   // SDK's API interface address.
  wsAddr: "",    // SDK's WebSocket address.
  dataDir: "",   // Data storage path. For example, you can use getApplicationDocumentsDirectory() to get a path.
  logLevel: 6,   // Log level (default value is 6).
  listener: OnConnectListener(
    onConnectSuccess: () {
      // Successfully connected to the server.
    },
    onConnecting: () {
      // Connecting to the server, suitable for showing a "Connecting" status on the UI.
    },
    onConnectFailed: (code, errorMsg) {
      // Failed to connect to the server, you can notify the user that the current network connection is not available.
    },
    onUserSigExpired: () {
      // User's login token (UserSig) has expired, prompting the user to log in again with a new token.
    },
    onKickedOffline: () {
      // The current user has been kicked offline, and you can prompt the user to log in again with a message like "You have been logged in on another device. Do you want to log in again?"
    },
  ),
);

```
### Logging In and Listening for Connection Status

> Note1: You need to [deploy](https://github.com/openimsdk/open-im-server#rocket-quick-start) OpenIM Server first, the default port of OpenIM Server is 10001, 10002.  
> Note2: You need to set up the listeners first and then log in.


```dart
// Set listener
    OpenIM.iMManager
      //
      ..userManager.setUserListener(OnUserListener(
      ))
      // Add message listener (remove when not in use)
      ..messageManager.setAdvancedMsgListener(OnAdvancedMsgListener(
      ))

      // Set up message sending progress listener
      ..messageManager.setMsgSendProgressListener(OnMsgSendProgressListener(
      ))
      ..messageManager.setCustomBusinessListener(
      )
      // Set up friend relationship listener
      ..friendshipManager.setFriendshipListener(OnFriendshipListener(
      ))

      // Set up conversation listener
      ..conversationManager.setConversationListener(OnConversationListener(
      ))

      // Set up group listener
      ..groupManager.setGroupListener(OnGroupListener(
      ));

// Retrieve the profile of the currently logged-in user
final userInfo = await OpenIM.iMManager.login(
      userID: "", // userID is obtained from your own business server
      token: "", // The token should be acquired by your business server by exchanging with OpenIM server based on a secret key
    );

```

To log into the IM server, you need to create an account and obtain a user ID and token. Refer to the [access token documentation](https://doc.rentsoft.cn/restapi/userManagement/userRegister) for details.

### Receiving and Sending Messages 💬

OpenIM makes it easy to send and receive messages. By default, there is no restriction on having a friend relationship to send messages (although you can configure other policies on the server). If you know the user ID of the recipient, you can conveniently send a message to them.

```dart
//Send
 OpenIM.iMManager.messageManager.sendMessage(
            message: await OpenIM.iMManager.messageManager.createTextMessage(
              text: 'hello openim',
            ),
            userID: userID
          ).catchError((error, _){
          // Message sent successfully ✉️	

         } )
        .whenComplete(() {
 	  // Failed to send message ❌

         });

//Receive
OpenIM.iMManager.messageManager.setAdvancedMsgListener(OnAdvancedMsgListener(
        onRecvNewMessage:(Message msg) {
     	// Received new message 📨

	  }
      ))
```

## Examples 🌟

You can find a demo Flutter app that uses the SDK in the [open-im-flutter-demo](https://github.com/openimsdk/open-im-flutter-demo) repository.


## Community :busts_in_silhouette:

- 📚 [OpenIM Community](https://github.com/OpenIMSDK/community)
- 💕 [OpenIM Interest Group](https://github.com/Openim-sigs)
- 🚀 [Join our Slack community](https://join.slack.com/t/openimsdk/shared_invite/zt-2ijy1ys1f-O0aEDCr7ExRZ7mwsHAVg9A)
- :eyes: [Join our wechat (微信群)](https://openim-1253691595.cos.ap-nanjing.myqcloud.com/WechatIMG20.jpeg)

## Community Meetings :calendar:

We want anyone to get involved in our community and contributing code, we offer gifts and rewards, and we welcome you to join us every Thursday night.

Our conference is in the [OpenIM Slack](https://join.slack.com/t/openimsdk/shared_invite/zt-22720d66b-o_FvKxMTGXtcnnnHiMqe9Q) 🎯, then you can search the Open-IM-Server pipeline to join

We take notes of each [biweekly meeting](https://github.com/orgs/OpenIMSDK/discussions/categories/meeting) in [GitHub discussions](https://github.com/openimsdk/open-im-server/discussions/categories/meeting), Our historical meeting notes, as well as replays of the meetings are available at [Google Docs :bookmark_tabs:](https://docs.google.com/document/d/1nx8MDpuG74NASx081JcCpxPgDITNTpIIos0DS6Vr9GU/edit?usp=sharing).

## Who are using OpenIM :eyes:

Check out our [user case studies](https://github.com/OpenIMSDK/community/blob/main/ADOPTERS.md) page for a list of the project users. Don't hesitate to leave a [📝comment](https://github.com/openimsdk/open-im-server/issues/379) and share your use case.

## License :page_facing_up:

OpenIM is licensed under the Apache 2.0 license. See [LICENSE](https://github.com/openimsdk/open-im-server/tree/main/LICENSE) for the full license text.
