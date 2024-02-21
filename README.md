# SwiftUI_100_Knocks

## Knock16
- .buttonStyle()でボタンスタイルを指定するのがポイント
- .border()で要素に枠線を追加することができる。
  - 詳細な枠線を追加したいときは.overlayを使用する。

## Knock17
- sheetの表示は.sheet(isPresented:,content:)で行う。
- alertの表示は.alert(_:,isPresented:)で行う。
- TextFieldのスタイスは.textFieldStyle()というmodifierで指定する。
  - RoundedBorderTextFieldStyle()を指定することで、丸みの帯びたTextFieldとなる。

## Knock18
- Push遷移を行いたいときは以下の方法がある。
  - NavigationViewとNavigaitonLinkを用いた方法
    ```swift
    NavigationView {
            List(fruits, id: \.self) { fruit in
                NavigationLink(destination: SecondView(fruit: fruit)) {
                    Text(fruit)
            }
        }
    }
    ```
  - NavigationStackと.navigationDestination(isPresented:)を用いた方法
    ```swift
    NavigationStack {
        VStack {
            Button(action: {
                isActive = true
            }, label: {
                Text("Tap Me!!")
            })
        }
        .navigationDestination(isPresented: $isActive) {
            Text("Second View")
        }
    }
    ```

## Knock19
- 使い回すことが可能なViewは別ファイルとして切り出してあげるのが吉。
- GeometryReader
  - コンテンツを独自のサイズと座標空間の関数として定義するコンテナビュー。
  - このビューは、親レイアウトに柔軟な優先サイズを返します。
- 子ビューから親ビューにデータを渡す仕組みとして、PreferenceKeyを使用する。
  - 頻繁に使用することがある。
  - https://qiita.com/takehilo/items/2499c632c2e0e5cdcb06
- .onPreferenceChangeモディファイアに渡される値は、以下の引数valueで渡された値となる。
  ```swift
  Color.clear.preference(key: SizePreference.self, value: geometry.size)
  ```

## Knock20
- 文字の色は.foregroundStyle(:)モディファイアで指定できる。
  ```swift
  Text(" ❤️ ")
    .foregroundStyle(Color.red)
  ```
- フォントサイズは.font(:)モディファイアで指定できる。
  ```swift
  Text(" ❤️ ")
    .font(.system(size: 20).bold())
  ```
