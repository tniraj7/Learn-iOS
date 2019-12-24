import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            
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
        }.accentColor(Color(red: 0.5333, green: 0.8706, blue: 0.1843, opacity: 1))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            
            TabBar()
            .environment(\.colorScheme, .dark)
        }
    }
}
