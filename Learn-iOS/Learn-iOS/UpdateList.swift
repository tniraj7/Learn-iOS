import SwiftUI

struct UpdateList: View {
    
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
                    Button(action: {
                        
                    }) {Image(systemName: "gear")
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
