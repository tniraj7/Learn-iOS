import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            VStack {
                
                HStack {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                }
                Text("Certificate")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)

            }.background(Color.black)
            
            Image("Background")
                .cornerRadius(10)
                .background(Color.black)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
