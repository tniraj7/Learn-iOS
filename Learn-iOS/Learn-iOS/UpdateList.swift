import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
                NavigationLink(destination: Text("1")) {
                        Text("Hello, World!")
                }
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
