import SwiftUI

struct HomeList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(0 ..< 3) { item in
                    CourseView()
                }
            }
        }.shadow(color: Color("backgroundShadow3"), radius: 20, x: 0, y: 20)
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Build an app with SwiftUI")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(20)
                .lineLimit(4)
                .frame(width: 150)
            Spacer()
            Image("Illustration1")
        }
        .background(Color("background3"))
        .cornerRadius(30)
        .frame(width: 246, height: 360)
    }
}
