import SwiftUI

struct Settings: View {
    @State var recieve = false
    @State var number = 1
    @State var selection = 1
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $recieve) {
                    Text("Recieve notifications")
                }
                
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s": "") per week")
                }
                
                Picker(selection: $selection, label: Text("Favorite Course")) {
                    Text("SwiftUI").tag(1)
                    Text("React.js").tag(2)
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