import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(
        title: "Build an app with SwiftUI",
        image: "Illustration1",
        color: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    
    Course(
        title: "Design Course",
        image: "Illustration2",
        color: Color("background4"),
        shadowColor: Color("backgroundShadow4")
    )
]

struct HomeList: View {
    
    var courses = coursesData
    @State var showCourses: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30.0) {
                ForEach(courses) { item in
                    Button(action: { self.showCourses.toggle() }) {
                        CourseView(
                            title: item.title,
                            image: item.image,
                            color: item.color,
                            shadowColor: item.shadowColor
                        )
                         .sheet(isPresented: self.$showCourses) {
                                ContentView()
                        }
                    }
                }
            }
            .padding(.leading, 30)
            Spacer()
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList(showCourses: false)
    }
}

struct CourseView: View {
    
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color

    init(title: String, image: String, color: Color, shadowColor: Color) {
        self.title = title
        self.image = image
        self.color = color
        self.shadowColor = shadowColor
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(20)
                .lineLimit(4)
                .padding(.trailing, 50)

            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}
