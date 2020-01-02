import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    Course(title: "Design and animate your UI",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4")),
    Course(title: "Swift UI Advanced",
           image: "Illustration3",
           color: Color("background7"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Framer Playground",
           image: "Illustration4",
           color: Color("background8"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Flutter for Designers",
           image: "Illustration5",
           color: Color("background9"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]

struct HomeList: View {
    
    var courses = coursesData
    @State var showCourses: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 Courses")
                            .foregroundColor(Color.gray).offset(x: -20)
                    }
                    Spacer()
                }
                .padding(.leading, 70)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 30.0) {
                        ForEach(courses) { item in
                            Button(action: { self.showCourses.toggle() }) {
                                GeometryReader { gr in
                                    CourseView(
                                        title: item.title,
                                        image: item.image,
                                        color: item.color,
                                        shadowColor: item.shadowColor
                                    )
                                    .rotation3DEffect(
                                        Angle(
                                            degrees:
                                                Double(gr.frame(in: .global).minX - 40) / -20
                                            ),
                                            axis: (x: 0, y: 10.0, z: 0))
                                    .sheet(isPresented: self.$showCourses) {
                                            ContentView()
                                    }
                                }
                                .frame(width: 246, height: 360.0)
                            }
                        }
                    }
                    .padding(.leading, 40)
                    .padding(.top, 30)
                    Spacer()
                }
                .frame(height: 450)
                CertificateRow()
            }
            .padding(.top, 78.0)
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
                .padding(30)
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
