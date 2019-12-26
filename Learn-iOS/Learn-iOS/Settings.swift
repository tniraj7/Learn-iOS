import SwiftUI

struct Settings: View {
    @State var recieve = false
    @State var number = 1
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $recieve) {
                    Text("Recieve notifications")
                }
                
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s": "") per week")
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
