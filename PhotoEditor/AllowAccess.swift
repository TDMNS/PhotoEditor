//
//  ContentView.swift
//  Shared
//
//  Created by Oleg Kolbasa on 12.10.2022.
//

import SwiftUI
import Photos

struct AllowAccess: View {
    
    @State private var isShowingGalleryView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                NavigationLink("", destination: GalleryView(), isActive: $isShowingGalleryView)
                VStack {
                    Image(systemName: "duck")
                        .animation(.easeInOut)
                    Text("Access Your Photos and Videos")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                    Button {
                        let photos = PHPhotoLibrary.authorizationStatus()
                        if photos == .notDetermined {
                            PHPhotoLibrary.requestAuthorization({status in
                                if status == .authorized {
                                    isShowingGalleryView = true
                                }
                            })
                        }
                    } label: {
                        Text("Allow Access")
                            .fontWeight(.medium)
                            .frame(height: 50)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
        }.onAppear {
            let photos = PHPhotoLibrary.authorizationStatus()
            if photos == .authorized {
                isShowingGalleryView = true
            }
        }
    }
}

struct AllowAccess_Previews: PreviewProvider {
    static var previews: some View {
        AllowAccess()
    }
}
