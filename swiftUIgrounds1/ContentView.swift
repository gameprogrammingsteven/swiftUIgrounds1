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
    
    let allHikes = Hike.testInfo()
    @State private var isOnboardingViewActive: Bool = false
    @State var x: Double = 2;
    @State private var isAnimating = false;
    
    @ObservedObject var bindedVMs = BindableViewModelList()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(self.allHikes, id:\.name) { hike in
                    Text("" + hike.name)
                    
                }
                .frame(maxHeight: 200)
                
                if (isOnboardingViewActive) {
                    Button {
                        
                    } label: {
                        Text("Hihi")
                    }
                }
                
                Rectangle().fill(.blue).frame(minWidth: 0, maxWidth: .infinity,
                                              minHeight: 0, maxHeight: 10)
                
                ZStack {
                    Circle().stroke(style: .init(lineWidth: 2)).foregroundColor(.blue).background(Color.init(red: 1.0, green: 0.1, blue: 0.1, opacity: 0.3))
                        .cornerRadius(55)
                    
                    Circle().stroke(.green, lineWidth: 6)
                }
                .frame(maxWidth: 110, maxHeight: 110)
                
                Spacer();
                
                List(bindedVMs.list) { boundObj in
                    
                    NavigationLink {
                        Other()
                    } label: {
                        Text(boundObj.name)
                            .font(.title)
                    }
                }
                .frame(minHeight: 100)
                .foregroundColor(.black)
                Circle()
                
                //            withAnimation {
                //if condition
                //views switch
                //or state changes in here, affecting views
                //            }
                //            Spacer()
                HStack {
                    Button {
                        //            return nil;
                        self.x = 1 + 2;
                        bindedVMs.list.append(BindableViewModel(name: "M", idNumber:1))
                        withAnimation(.easeInOut(duration: 2.0)) {
                            isOnboardingViewActive.toggle() // = true;
                        }
                        
                    } label: {
                        
                        ZStack {
                            ZStack {
                                Color(.blue)
                            }
                            ZStack {
                                Color(.systemBlue)
                                    .cornerRadius(50)
                            }
                            .padding()
                            Text("Hi")
                                .font(.system(.title2, design: .serif))
                                .foregroundColor(.white)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                            //                            .opacity(isAnimating ? 1 : 0)
                            //                            .offset(y: isAnimating ? 0 : -40)
                            //                            .animation(.easeOut(duration: 1), value: isAnimating)
                        }
                        .cornerRadius(30)
                        .padding(.horizontal)
                        //                    .controlSize(.large)
                        //                    .buttonBorderShape(.capsule)
                    }
                    .buttonStyle(.plain)
                    .frame(minHeight: 100.0)
                } //Bottom Hstack
                .frame(maxHeight: 100)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .scaleEffect(isAnimating ? 1 : 0.5)
                .animation(
                    Animation.easeOut(duration: 0.2)
                        .repeatCount(3)
                    , value: isAnimating)
                .onAppear { //it takes the value as the trigger for when to animate.
                    isAnimating = false
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    isAnimating = true;
                })
            })
        }// Nav

            
            /*
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
             
             
             /*
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
              */
             // MARK: animation
             
             AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
             switch phase {
             case .success(let image):
             image.imageModifier()
             //                    .transition(.move(edge: .bottom))
             //                    .transition(.slide)
             .transition(.scale)
             case .failure(_):
             Image(systemName: "ant.circle.fill")
             case .empty:
             Image(systemName: "photo.circle.fill")
             @unknown default:
             ProgressView()
             }
             }
             .padding(40)
             
             //        VStack {
             //            Image(systemName: "globe")
             //                .imageScale(.medium)
             //                .foregroundColor(.red)
             //            Text("Hello, world!")
             //        }
             //        .padding()
             //        .border(Color.purple, width: 5)
             //        .blur(radius: 0)
             */
        } //body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
