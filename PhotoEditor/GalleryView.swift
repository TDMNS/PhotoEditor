//
//  GalleryView.swift
//  PhotoEditor
//
//  Created by Oleg Kolbasa on 15.10.2022.
//

import SwiftUI
import Photos

struct GalleryView: View {
    
    @ObservedObject var photos = PhotosModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack {
                        ForEach(photos.allPhotos, id: \.self) { photo in
                            Image(uiImage: photo)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .aspectRatio(1, contentMode: .fit)
                        }
                        .alert(isPresented: .constant(self.photos.errorString != "") ) {
                            Alert(title: Text("Error"), message: Text(self.photos.errorString ), dismissButton: Alert.Button.default(Text("OK")))
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

class PhotosModel: ObservableObject {
    
    @Published var allPhotos = [UIImage]()
    @Published var errorString : String = ""
    
    init() {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                self.errorString = ""
                self.getAllPhotos()
            case .denied, .restricted:
                self.errorString = "Photo access permission denied"
            case .notDetermined:
                self.errorString = "Photo access permission not determined"
            @unknown default:
                fatalError()
            }
        }
    }
    
    fileprivate func getAllPhotos() {
        
        let manager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.deliveryMode = .highQualityFormat
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let results: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        if results.count > 0 {
            for i in 0..<results.count {
                let asset = results.object(at: i)
                let size = CGSize(width: 700, height: 700) //You can change size here
                manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: requestOptions) { (image, _) in
                    if let image = image {
                        self.allPhotos.append(image)
                    } else {
                        print("error asset to image")
                    }
                }
            }
        } else {
            self.errorString = "No photos to display"
        }
    }
}
