# flutter_doctors_demo
### 1.1. Flutterをインストールする

[FlutterインストールWebサイト](https://flutter.io/docs/get-started/install)の通りにインストールする
`fvm flutter doctor`を実行してすべてが正しく機能するかを確認する。

### 1.1. Doctors Demo App（Makefile）をインストールする。

`make help`コマンドを実行すると、以下のように出力される。

    make help
    analyze                          Analyze the code
    build_android_dev                Build apk application in dev
    build_android_staging            Build apk bundle application in staging
    build_app_bundle_android_dev     Build app bundle application in dev
    build_app_bundle_android_staging Build app bundle application in staging
    build_ios_dev                    Build ios application in dev
    build_ios_staging                Build ios application in staging
    clean                            Cleans the environment
    colors                           show all the colors
    format                           Formats the code
    gen                              Trigger one time code generation
    lint                             Lints the code
    run_dev_mock                     Runs the mobile application in dev
    run_stg                          Runs the mobile application in dev
    run_unit_test                    Runs unit tests
    setup                            Setup project
    upgrade                          Upgrades dependencies
    watch                            Watch files and trigger code generation on change

参照:

* http://clarkgrubb.com/makefile-style-guide
* http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

#### 新規プロジェクトインストール手順

1. 前提条件に通り、インストールしてください。
2. `make setup`コマンドを実行して、プロジェクトをインストールしてください。
---
# II. システムアーキテクチャ (Clean Architecture)

Projectの構成
---
```
project
│   README.md
│   pubspec.yaml
│
└───assets
│
└───lib
│   │   main.dart
│   │   initialize.dart
│   │   main_staging.dart
│   │   main_staging.dart
│   │   navigation.dart
│   │
│   └───config
│   │       flavor
│   │
│   └───data
│   └───domain
│   └───gen
│   └───presentation
│   │       pages
│   │       view_models
│   │       components
│   │       navigation
│   │       theme
│   │
│   └───utils
│   
└───pigeons
│      navigation.dart
│   
└───android
│   └───app
│   │   │    build.gradle
│   │   │
│   │   │
│   │   └───src
│   │       │ 
│   │       └───main
│   │       │   │   AndroidManifest.xml
│   │       │   │
│   │       │   └───kotlin
│   │       │   │    └───com 
│   │       │   │        └───doctors 
│   │       │   │            └───demo
│   │       │   │                    DemoActivity.kt 
│   │       │   │                    MainActivity.kt 
│   │       │   │
│   │       │   └─── ... 
│   │       └─── ...
│   │
│   └───gradle
│           ...
│       
└───ios
    └───Runner
    │        AppDelegate.swift
    │        ...
    └─── ...
```
---
本プロジェクトはClean Architectureに基づいて構築され、以下の5つの階層が含まれている。

## 3.システムアーキテクチャの詳細

### A. Clean Architectureの定義

![IMAGE_DESCRIPTION](assets/CleanArchitecture.jpg)

### 3.1.Data

- Dataモジュールとは、最外層であり、データの取得の役割がある。

### Dataの内容

### Repositories

- Data層のリポジトリは、domain層のリポジトリから実装する必要がある。
- データベースまたは他の方法からデータを取得する。
- API呼び出しと高レベルのデータを担当する。

### Models

- プラットフォームに依存する可能性のある追加メンバーの追加によるエンティティの拡張。

### 3.2.Domain

- Domainモジュールは、アプリケーションのビジネスロジックを定義する。 これは、開発プラットフォームから独立したモジュールである。
  つまり、プログラミング言語で記述されており、プラットフォームの要素は含まれていない。
  理由としては、Domainはアプリケーションのビジネスロジックのみに注目し、実装の詳細には関係することではない。 これにより、問題が発生した場合にプラットフォーム間で簡単に移行することもできる。


### 3.2.1.Entities

- 企業全体のビジネスルール。
- メソッドを含むクラスで構成されている。
- アプリケーションのビジネスオブジェクト。
- アプリケーション全体で使用。
- アプリケーション内の何かが変更されたときに変更される可能性が最も低い。

#### 3.2.2.Repositories

- 外層の期待機能を定義する抽象クラス。
- 外層からユースケースに渡される。
- ドメインは最内層を表す。したがって、これはアーキテクチャの中で最も抽象的なレイヤーである。

### 3.3.UI

- ページのUIを表す。
- 状態管理：`hooks_riverpod`

### 3.4. Utils

- Utilsフォルダーには、アプリケーション全体で使用されるhelpers、services、UI utils、検証ミックスインが含まれている。

### 3.5. Config

- 各フレーバーの動的変数を構成および定義する。


---
# III. Platform Channel
![IMAGE_DESCRIPTION](assets/PlatformChannels.png)

---
# IV.参照

- [アプリアーキテクチャガイド](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [platform-channels](https://docs.flutter.dev/development/platform-integration/platform-channels)