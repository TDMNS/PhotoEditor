//
//  ContentView.swift
//  Shared
//
//  Created by Oleg Kolbasa on 12.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
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
                    print("Action on click button")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
