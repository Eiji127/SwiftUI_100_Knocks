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
