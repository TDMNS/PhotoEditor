import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                LottieView(name: "duck", loopMode: .loop)
                    .frame(width: 144, height: 144)
                    .padding(.bottom, 20)
                Text("Access Your Photos and Videos")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding(.bottom, 28)
                Button {
                    print("Action on click button")
                } label: {
                    Text("Allow Access")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .frame(height: 50)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 16)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
