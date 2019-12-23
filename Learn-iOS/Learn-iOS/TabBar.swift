import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView(selection: .constant(1)) {
        Text("Tab Content 1").tabItem { Text("Tab Label 1") }.tag(1)
        Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
