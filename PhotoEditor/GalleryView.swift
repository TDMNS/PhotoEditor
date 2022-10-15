//
//  GalleryView.swift
//  PhotoEditor
//
//  Created by Oleg Kolbasa on 15.10.2022.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Second screen")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
            }
        }.navigationBarHidden(true)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
