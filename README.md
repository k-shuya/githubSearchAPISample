# GithubSearchAPISample

## アーキテクチャ
勉強を兼ねてVIPERで実装しました。


## 使用したライブラリ

|ライブラリ|理由|
|:-|:-|
|Alamofire|APIリクエストの処理をシンプルに実装するため|
|AlamofireImage|非同期で画像の読み込みを行うため|
|SwiftLint|コード解析のため|
|Sourcery|VIPERの各モジュールのボイラーテンプレートを自動生成するため|


## 工夫ポイント

VIPERの各モジュールのボイラーテンプレートを自動生成するようにしました。

webviewの読み込み時にprogressViewを実装してユーザに進捗が見えるようにしました。

文字列などは基本的にConfigファイルにまとめ、後々の保守性に配慮しています。

あえてプロジェクト作成時にUserInterfaceをSwiftUIにして、両方に対応できるようにしています。

