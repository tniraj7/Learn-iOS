import SwiftUI

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct Home: View {
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            HomeList(showCourses: false)
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 20, initialVelocity: 15))
                .offset(y: showProfile ? 80 :UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                     MenuButton(show: $show)
                        .offset(x: -10, y: showProfile ?  0 : 30)
                        .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 5))
                    Spacer()
                    MenuRight(show: $showProfile)
                        .offset(x: -16, y: showProfile ?  0 : 30)
                        .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 5))
                }
                Spacer()
            }
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32.0, height: 32.0)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}


struct MenuView: View {
    var menu = menuData
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(BlurView(style: .systemThickMaterial))
        .cornerRadius(30)
        .padding(.trailing, 30)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(BlurView(style: .systemThickMaterial))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: { self.show.toggle() }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(BlurView(style: .systemThickMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                .offset(x: -30)
                
            }
            Spacer()
        }
    }
}

struct MenuRight: View {
    @Binding var show: Bool
    var body: some View {
            HStack {
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "bell")
                }
            }
    }
}
