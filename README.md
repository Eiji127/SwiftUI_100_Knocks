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

## Knock22
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
## Knock24
- リスト表示を行うとき、ForEachを使用せずに、以下のようにListのclousure内で配列の要素を抽出することができる。
  ```swift
  let pokemons: [Pokemon] = [Pokemon(id: 143, name: "Snorlax"),
                               Pokemon(id: 25, name: "Pikachu"),
                               Pokemon(id: 138, name: "Psyduck"),
                               Pokemon(id: 9, name: "Blastoise"),
                               Pokemon(id: 79, name: "Slowpoke")]
  var body: some View {
    List(pokemons) { pokemon in
      ...
    }
  }
  ```
- 以下のようにpokemonの値をalert側に渡し、alertで値を表示したとき、参照がおかしくなり、配列内の値がランダムに表示される。
  ```swift
  List {
    ForEach(pokemons, id: \.self) { pokemon in
      Button(action: {
        isAlertPresented = true
      }, label: {
        Text(pokemon)
      })
      .alert(Text(pokemon), isPresented: $isAlertPresented) {
        Button("Close", role: .none) {
          print("Tapped Close Button.")
        }
      }
    }
  }
  ```
- alertに値を渡してあげるときは、渡す用の変数をView内で定義してあげ、.alertモディファイアのpresenting引数に渡してあげるのが良い。
  ```swift
  @State var pokemon: Pokemon?

  var body: some View {
    List(pokemons) { pokemon in
      ... 
    }
    .alert(Text("Alert"), isPresented: $isAlertPresented, presenting: pokemon) { pokemon in
      ...
    }
  }
  ```
## Knock25
- 前画面の関数を呼び出したいときはUIKitベースの開発と同様に、delegateメソッドを用意してあげると良い。
  ```swift
  struct SecondView: View {
    var delegate: MyProtocol
    
    var body: some View {
      Button {
        delegate.hoge()
      } label: {
        Text("Tapped Delegate Method")
      }
    }
  }
  ```
## Knock26
- .navigationDestinationモディファイアのクロージャー内では、.alertモディファイアのように、View内で定義したOptinal型の変数は渡せない。また、クラッシュする。
  ```swift
  // .alertモディファイアのとき
  .alert(Text("Alert"), isPresented: $isAlertPresented, presenting: pokemon) { pokemon in // ✅ Suceeded
    ...
  }
  
  // .navigationDestinationモディファイアのとき
  .navigationDestination(isPresented: $isPresented) {
    switch self.pokemon.type { // ⛔️ Error: Value of optional type 'Pokemon?' must be unwrapped to refer to member 'type' of wrapped base type 'Pokemon'
    case .normal:
      NormalView(pokemon: self.pokemon)
    case .electric:
      ElectricView(pokemon: self.pokemon)
    case .water:
      WaterView(pokemon: self.pokemon)
    default:
      Text("Ohter Type")
    }
  }
  ```
- Listでそれぞれの画面に遷移させたいときは列挙型(Enum)とswitch文を活用すると良い。
## Knock27
- PickerViewを表示するときは、Picker()を使用する。
  ```swift:
  Picker(selection: $hoge, label: EmptyView()) {
    ...
  }
  ```
- .pickerStyleモディファイアを使用する。
  ```swift
  Picker(selection: $hoge, label: EmptyView()) {
    ...
  }
  .pickerStyle(WheelPickerStyle())
  ```
- Picker内で指定した値は、publisherとして.onReceiveモディファイアの引数としてセットし、値を他のAPIに渡してあげる。
  ```swif
  Picker(selection: $hoge, label: EmptyView()) {
    ...
  }
  .onReceive([selectedHour].publisher.first()) { (value) in
    print("hour: \(value)")
  }
  ```
## Knock28
- sheetをフルスクリーン表示させたいときはfullScreenCover(isPresented:,content:)モディファイアを使用する。
```swift
VStack {
    Button {
        isFullScreenPresented = true
    } label: {
        Text("Tap me!")
    }
}.fullScreenCover(isPresented: $isFullScreenPresented, content: {
    SecondView()
})
```
## Knock29
- VStackあるいはHStackに対して、画面全体的に操作を加えたいときはframeモディファイアの引数maxWidthおよびmaxHeightに.infinityを指定する。
  ```swift
  VStack {
    ...
  }
  .frame(maxWidth: .infinity, maxHeight: .infinity)
  .background(Color.gray)
  ```
## Knock30
- NavigationBarのTitleを指定するときは、.navigationBarTitle()を使用する。
- NavigationBarを非表示にしたいときは、以下のような.toolBarモディファイアを用いて、引数に.hidden、.navigationBarを指定する。
  ```swift
  NavigationStack {
    Text("No Navigation Bar")
        .navigationBarTitle("Not Showing Title")
        .toolbar(.hidden, for: .navigationBar)
  }
  ```
-  NavigationBarの非表示には、.navigationBarHidden(true)を付与しても可能だが、deprecatedとなっているので注意！
## Knock31
- Previewを横向きにしたいときは#Previewのマクロの引数traitsに.landscapeLeftを渡してあげるのが良い。
  ```swift
  #Preview(traits: .landscapeLeft) {
    ContentView()
  }
  ```
- #Previewマクロに対して、.previewInterfaceOrientationモディファイアは無効となるため、注意が必要。
  ```swift
  #Preview {
    ContentView()
        .previewInterfaceOrientation(.landscapeLeft) // ⛔️ Previewには反映されず横向けにはならない！
  }

  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft) // ✅ Previewに反映され、横向きとなる
    }
  }  
  ```
## Knock32
- 何かしらのデータ (イベント) を検知する際に使用するのが、.onReceiveモディファイアとなる。
  - 今回だと、NotificationCenter関連のイベントを取得している。
- 端末のシェイクを検知するときは以下のものを設定すると良い。
  ```swift
  struct ContentView: View {
    @State var message = "Shake me!"
    
    var body: some View {
        VStack {
            Text(message)
                .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification), perform: { _ in
                    ...
                })
        }
        .padding()
    }
  }

  
  extension NSNotification.Name {
    public static let deviceDidShakeNotification = NSNotification.Name("DeviceDidShakeNotification")
  }

  extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
  }
  ```
## Knock33
- CollectionViewのようなViewを構築したいときは、ScrollView × LazyVGridを使用する。
  ```swift
  let columns: [GridItem] = [GridItem(.fixed(80)),
                             GridItem(.fixed(80)),
                             GridItem(.fixed(80)),
                             GridItem(.fixed(80))]
  var body: some View {
    ScrollView {
        LazyVGrid(columns: columns) {
            ForEach(0..<100, id: \.self) { index in
                Text("\(index)")
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .frame(width: 80, height: 80)
                    .background(Color.gray)
            }
        }
    }
  }
  ```
- Xcode15のPreviewの不具合かはわからないが、.background(Color.gray)を.frame()よりも上に表記すると、.frameが効かないという不具合がある。
## Knock34
- ウォークスルー画面（チュートリアル画面）はTabViewを用いて実装する。
- ページング機能をつけたいときは、TabViewの.tabViewStyleモディファイアで.pageを指定する。
  ```swift
  var body: some View {
    TabView {
        ContentViewCell(imageName: "Pikachu")
        ContentViewCell(imageName: "Pikachu")
        ContentViewCell(imageName: "Pikachu")
        ContentViewCell(imageName: "Pikachu")
        ContentViewCell(imageName: "Pikachu")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.gray)
    .tabViewStyle(.page)
    .menuIndicator(.visible)
  }
  ```
## Knock35
- modal viewでスワイプでビューを閉じれないようにするには、遷移先のビューに.interactiveDismissDisabled()を指定する。
  ```swift
  VStack {
    ...
  }
  .sheet(isPresented: $isModalShown) {
    Text("modal View is shown")
        .interactiveDismissDisabled()
  }
  ```
## Knock36
- LaunchScreenの実装方法
  1. 列挙型enumでViewTypeを用意し、画面ごとにcaseを設定する。
     ```swift
     enum ViewType {
       case launch
       case home
     }
     ```
  2. body内でswitch文で切り替える。
    ```swift
    ZStack {
      switch viewType {
      case .home:
        Text("Home")
      case .launch:
        Image("Pikachu")
            .resizable()
            .frame(width: 200, height: 200)
      }
    }
    ```
  3. .onAppearモディファイアのクロージャ内でwithAnimation関数とsleep関数を用いて、viewTypeを.homeに設定する。
    ```swift
    ZStack {
      ...
    }
    .onAppear {
      Task {
        try? await Task.sleep(nanoseconds: UInt64(3 * 1_000_000_000))
        withAnimation(.linear(duration: 0.5)) {
          viewType = .home
        }
      }
    }
    ```
