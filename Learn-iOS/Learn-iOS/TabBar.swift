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
            
            ContentView().tabItem {
                VStack {
                    Image("IconCards")
                    Text("Certificates")
                }
            }.tag(2)
            
            UpdateList().tabItem {
                VStack {
                    Image("IconSettings")
                     Text("Updates")
                }
            }.tag(3)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
