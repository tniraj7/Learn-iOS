import SwiftUI

struct UpdateList: View {
    
    @State var showSettings = false
    
    var body: some View {
        NavigationView {
            List(0 ..< 20) { item in
                NavigationLink(destination: Text("1")) {
                    Text("Hello, World!")
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(
                trailing: HStack {
                    Button(action: { self.showSettings.toggle() })
                    { Image(systemName: "gear")
                        .sheet(isPresented: self.$showSettings) {
                            Text("Settings")
                        }
                    }
                }
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}
