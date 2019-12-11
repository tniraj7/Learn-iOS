import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .leading) {
            MenuRow(image: "person.crop.circle", text: "My Account")
            MenuRow(image: "creditcard", text: "Billing")
            MenuRow(image: "person.and.person", text: "Team")
            MenuRow(image: "arrow.uturn.down", text: "Sign Out")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32.0, height: 32.0)
            Text(text)
                .font(.headline)
        }
    }
}
