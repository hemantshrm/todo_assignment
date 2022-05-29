# Todo_assignment

A Simple TODO application with Clean UI.

[**Application Download Link**](https://drive.google.com/file/d/1oNocd-xj-RFxSBtRfMJiT0gxddtomk8C/view?usp=sharing
)
## Features🪄

- Login/SignUp with fast Local Storage.
- Add/Edit/Remove Todo's.
- Clean UI


## Installation

This App requires latest  [Flutter](https://flutter.dev/) v3.0.1 and [Dart](https://dart.dev/) v2.17.1 to run.

Enable Dart Support &
Install the dependencies by using .

```sh
flutter pub get
```

To run the application
```sh
flutter run
```

## Plugins

Plugins Used in this application are.

| Plugin | Used For |
| ------ | ------ |
| GetStorage |  Local Storage |
| GetX |  State Management |
| flutter_slidable | Slidable functionality for Delete & Edit |
| flutter_svg |  SvgPicture support |
| flutter_screenutil |  Responsive Text |




#### Building for Development

For **ANDROID**
production release:

```sh
flutter build apk --obfuscate --split-debug-info=debug-info
```

For **IOS**
Note: You need an IOS machine to build ipa.

```sh
flutter build ipa --obfuscate --split-debug-info=debug-info
```

