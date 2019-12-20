import SwiftUI

struct UpdateDetail: View {
    var title: String
    var text: String
    var image: String
    
    init(title: String, text: String, image: String) {
        self.title = title
        self.text = text
        self.image = image
    }
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text(text)
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(30.0)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail(title: "SwiftUI", text: "Loading...", image: "Illustration1")
    }
}
