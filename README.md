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

## Knock21
- where句は、型パラメータの追加の条件を指定するために使用している。
  - 具体的には、Content という型パラメータに対して、条件として Content 型が View プロトコルを満たす必要があります。つまり、Content に指定される型は、SwiftUIのビューとして振る舞える必要がある。。
  ```swift
  struct CardView<Content>: View where Content: View {
    ...
    let content: () -> Content
  }

  struct ContentView: View {
    var body: some View {
      CardView {
        Text("Snorlax")
      }
    }
  }
  ```
- Viewに対して影をつけたいときは、.shadowモディファイアを使用すると良い。
- Viewに丸みをもたせたいときは、.clipShapeモディファイアを使用すると良い。
  - Xcode15から、.cornerRadiusモディファイアはdeprecatedとなっているため、.clipShapeを使用するのが良い。
    https://developer.apple.com/documentation/swiftui/view/cornerradius(_:antialiased:)

## knock22
- ViewModifierで指定する場合、以下の流れで作成する。
  - まず、追加したい特徴をもったViewを返す関数を有するカスタムViewModifierを追加する。
    ```swift
    struct CardViewModifier: ViewModifier {
      let color: Color
      let radius: CGFloat
      func body(content: Content) -> some View {
          content
            .padding(16)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
      }
    }
    ```
  - 次に、Viewに対して作成したViewModifierをmodifier()の引数に指定して返してあげる。
    ```swift
    extension View {
      func card(
        color: Color = Color.gray.opacity(0.4),
        radius: CGFloat = 8
      ) -> some View {
        self.modifier(CardViewModifier(color: color, radius: radius))
      }
    }
    ```
## Knock23
- リスト内の要素を削除したいときは、.onDeleteモディファイアと、EditButton()を活用する。
- .navigationBarItems(:)はdeprecatedとなっているため、代わりに.toolbar()を活用する。
  ```swift
  // Deprecated
   List {
    ...
  }
  .navigationBarItems(trailing: EditButton())

  // Suggested
  List {
    ...
  }
  .toolbar {
    ToolbarItem(placement: .primaryAction) {
      EditButton()
    }
  }
  ```
