import SwiftUI

struct Settings: View {
    @State var recieve = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var courses = ["SwiftUI", "React.js", "Flutter", "Vue.js"]
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
                    ForEach(0..<courses.count) {
                        Text("\(self.courses[$0])")
                    }
                }
                
                DatePicker(selection: $date, label: { Text("Date") })
                
                Section(header: Text("Email")) {
                    TextField("Your email: ", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: { self.submit.toggle()}) { Text("Submit") }
                
                .alert(isPresented: $submit) {
                    Alert(
                        title: Text("Thanks!"),
                        message: Text("Email: \(email)\n Notifications: \(number) email per week\n Favorite Course: \(courses[selection])\n Date: \(date)"),
                        dismissButton: .default(Text("Ok"))
                    )
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
