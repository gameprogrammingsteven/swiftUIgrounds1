//
//  ContentView.swift
//  swiftUIgrounds1
//
//  Created by Stephen Johnson on 10/29/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
        .resizable()
        .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.8)
    }
    
}
struct ContentView: View {
    var body: some View {
        let imageURL: String = "https://credo.academy/credo-academy@3x.png";
        //ant if URL fail.gi
        //MARK: 1. BASIC
//        AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. Scale
//        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        // MARK: - 3. Placeholder
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image
//                .imageModifier()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
//        .padding(40)
        

        // MARK: - 4. PHASE changes
        AsyncImage(url: URL(string:imageURL)) { phase in
//            switch phase {
//            case .
//            }
            if let image = phase.image {
                image.imageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill")
                    .iconModifier()
            } else {
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
            }
        }.padding(40)
        
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.medium)
//                .foregroundColor(.red)
//            Text("Hello, world!")
//        }
//        .padding()
//        .border(Color.purple, width: 5)
//        .blur(radius: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
