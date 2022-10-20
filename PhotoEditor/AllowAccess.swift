import SwiftUI
import Lottie

@available(iOS 13.0, *)
struct AllowAccess: View {
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
                ShimmerButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllowAccess()
    }
}

struct ShimmerButton: View {
    @State var isShimmerShowed = false
    var shimmerArea = (UIScreen.main.bounds.width / 2) + 110
    
    var body: some View {
        ZStack {
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
            }.contentShape(Rectangle())
            
            Color.white.opacity(0.3)
                .frame(height: 50)
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(10)
                .padding([.leading, .trailing], 16)
                .allowsHitTesting(false)
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: .init(colors: [.clear, Color.white.opacity(0.8), .clear]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 200)
                    .cornerRadius(10)
                    .offset(x: isShimmerShowed ? shimmerArea : -shimmerArea)
            )
        }
        .onAppear {
            withAnimation(Animation.default.speed(0.3).delay(0)
                .repeatForever(autoreverses: false)) {
                    isShimmerShowed.toggle()
                }
        }
    }
}
