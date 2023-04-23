//
//  IntroView.swift
//  Taico
//
//  Created by 하명관 on 2022/11/16.
//

import SwiftUI

struct IntroView: View {
    
    @State var showWalkThroughScreens: Bool = false
    @State var currentIndex: Int = 0
    @State var showHomeView: Bool = false
    @Namespace var animation
    
    var body: some View {
        
        ZStack{
            
            if showHomeView{
                
                withAnimation{
                    MainView()
                        .transition(.move(edge: .trailing))
                }

            }else{
                ZStack{
                    Color("MainColor")
                        .ignoresSafeArea()
                    
                    IntroScreen()
                    
                    WalkThroughScreens()
                    
                    NavBar()
                }
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.35), value: showHomeView)
    }

    @ViewBuilder
    func WalkThroughScreens()->some View{
        
        let isLast = currentIndex == intros.count
        
        GeometryReader{
            let size = $0.size
            
            ZStack{
                // MARK: Walk Through Screens
                ForEach(intros.indices,id: \.self){index in
                    ScreenView(size: size, index: index)
                        .padding(.bottom,100)
                }
                
                WelcomeView(size: size, index: intros.count)
                    .padding(.bottom,150)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .bottom, content: {
                Indicators()
                    .opacity(isLast ? 0 : 1)
                    .animation(.easeInOut(duration: 0.35), value: isLast)
                    .offset(y: -180)
            })

            .overlay(alignment: .bottom) {

                ZStack{
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20))
                        .foregroundColor(Color("MainColor"))
                        .scaleEffect(!isLast ? 1 : 0.001)
                        .opacity(!isLast ? 1 : 0)
                    
                    HStack{
                        Text("Start")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("MainColor"))
                            .frame(maxWidth: .infinity,alignment: .center)
                    }
                    .padding(.horizontal,15)
                    .scaleEffect(isLast ? 1 : 1)
                    .frame(height: isLast ? nil : 0)
                    .opacity(isLast ? 1 : 0)
                }
                .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: isLast ? 10 : 30, style: isLast ? .continuous : .circular)
                        .fill(Color("SubColor"))

                }
                .onTapGesture {
                    if currentIndex == intros.count{
                        // Signup Action
                        showHomeView = true
                    }else{
                        currentIndex += 1
                    }
                }
                .offset(y: isLast ? -40 : -90)
                // Animation
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: isLast)
            }
            .overlay(alignment: .bottom, content: {
                let isLast = currentIndex == intros.count
                
            })
            .offset(y: showWalkThroughScreens ? 0 : size.height)
        }
    }
    
    // Forgot to add in the YT Video
    @ViewBuilder
    func Indicators()->some View{
        HStack(spacing: 8){
            ForEach(intros.indices,id: \.self){index in
                Circle()
                    .fill(Color("SubColor"))
                    .frame(width: 15, height: 15)
                    .overlay {
                        if currentIndex == index{
                            Circle()
                                .stroke(Color.white,lineWidth: 4)
                                .frame(width: 15, height: 15)
                                .matchedGeometryEffect(id: "INDICATOR", in: animation)
                        }
                    }
                
            }

        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: currentIndex)
    }
    
    @ViewBuilder
    func ScreenView(size: CGSize,index: Int)->some View{
        let intro = intros[index]
        
        VStack(spacing: 10){
            Text(intro.title)
                .foregroundColor(.white)
                .font(.system(size: 38))
                .fontWeight(.bold)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text(intro.subtitle)
                .foregroundColor(.white)
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .padding(.top,30)
                .padding(.horizontal,30)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350,alignment: .top)
                .padding(.top,30)
                .padding(.horizontal,20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
        }
        .offset(y: -30)
    }
    

    
    @ViewBuilder
    func NavBar()->some View{
        let isLast = currentIndex == intros.count
        
        HStack{
            Button {
                // If Greater Than Zero Then Eliminating Index
                if currentIndex > 0{
                    currentIndex -= 1
                }else{
                    showWalkThroughScreens.toggle()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20))
                    .font(.title3)
                    .foregroundColor(Color.white)
            }

            Spacer()
            
            Button("Skip"){
                currentIndex = intros.count
            }
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .opacity(isLast ? 0 : 1)
            .animation(.easeInOut, value: isLast)
        }
        .padding(.horizontal,45)
        .padding(.top,10)
        .frame(maxHeight: .infinity,alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
    }

    
    @ViewBuilder
    func WelcomeView(size: CGSize,index: Int)->some View{
        VStack(spacing: 10){
            
//            Image("WesternGorilla")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 450,alignment: .top)
//                .padding(.horizontal,20)
//                .offset(x: -size.width * CGFloat(currentIndex - index))
//                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            Text("Endangerd Animals in Africa")
                .font(.system(size: 78).bold())
                .foregroundColor(.white)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.1 : 0), value: currentIndex)
            
            
        }
        .offset(y: 60)
    }
    
    @ViewBuilder
    func IntroScreen()->some View{
        GeometryReader{
            let size = $0.size
            
            VStack(spacing: 10){
                
                Image("First")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height / 2)
                    .padding(.top,150)
                
//                Text("Endangerd")
//                    .foregroundColor(.white)
//                    .font(.system(size: 48).bold())
//                    .padding(.top,55)
                
                
                Text("Learn Africa")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.horizontal,40)
                    .padding(.vertical,14)
                    .foregroundColor(Color("MainColor"))
                    .background {
                        Rectangle()
                            .fill(Color("SubColor"))
                            .cornerRadius(20)
                            .shadow(color: Color.black, radius: 1, y: 2)
                            
                    }
                    .onTapGesture {
                        showWalkThroughScreens.toggle()
                    }
                    .padding(.top,30)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .offset(y: showWalkThroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
