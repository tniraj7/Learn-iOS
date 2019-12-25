import SwiftUI

struct Settings: View {
    @State var recieve = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $recieve) {
                    Text("Recieve notifications")
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
