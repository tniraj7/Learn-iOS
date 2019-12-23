import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(selection: .constant(1)) {

            Home().tabItem {
                VStack {
                    Image("IconHome")
                    Text("Home")
                }
            }.tag(1)


        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
