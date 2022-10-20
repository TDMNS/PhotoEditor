import SwiftUI
import Lottie

struct AllowAccess: View {
    
    private let lottieName = "duck"
    private let textTitle = "Access Your Photos and Videos"
    private let lottieWidth: CGFloat = 144
    private let lottieHeight: CGFloat = 144
    private let paddingLottieAndText: CGFloat = 20
    private let fontSize: CGFloat = 20
    private let paddingTextAndShimmer: CGFloat = 28
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                LottieView(name: lottieName, loopMode: .loop)
                    .frame(width: lottieWidth, height: lottieHeight)
                    .padding(.bottom, paddingLottieAndText)
                Text(textTitle)
                    .font(.system(size: fontSize))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding(.bottom, paddingTextAndShimmer)
                ShimmerButton {
                    print("Action on click button")
                }
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
    let action: () -> Void
    
    private let fontSize: CGFloat = 17
    private let viewHeight: CGFloat = 50
    private let minWidth: CGFloat = 0
    private let maxWidth: CGFloat = .infinity
    private let viewCornerRadius: CGFloat = 10
    private let padding: CGFloat = 16
    private let colorOpacity: CGFloat = 0.3
    private let gradientOpacity: CGFloat = 0.8
    private let rectangleWidth: CGFloat = 200
    private let animationSpeed: CGFloat = 0.3
    private let animationDelay: CGFloat = 0
    
    var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                Text("Allow Access")
                    .font(.system(size: fontSize))
                    .fontWeight(.semibold)
                    .frame(height: viewHeight)
                    .frame(minWidth: minWidth, maxWidth: maxWidth)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(viewCornerRadius)
                    .padding([.leading, .trailing], padding)
            }.contentShape(Rectangle())
            
            Color.white.opacity(colorOpacity)
                .frame(height: viewHeight)
                .frame(minWidth: minWidth, maxWidth: maxWidth)
                .cornerRadius(viewCornerRadius)
                .padding([.leading, .trailing], padding)
                .allowsHitTesting(false)
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: .init(colors: [.clear, Color.white.opacity(gradientOpacity), .clear]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: rectangleWidth)
                    .cornerRadius(viewCornerRadius)
                    .offset(x: isShimmerShowed ? shimmerArea : -shimmerArea)
            )
        }
        .onAppear {
            withAnimation(Animation.default.speed(animationSpeed).delay(animationDelay)
                .repeatForever(autoreverses: false)) {
                    isShimmerShowed.toggle()
                }
        }
    }
}
