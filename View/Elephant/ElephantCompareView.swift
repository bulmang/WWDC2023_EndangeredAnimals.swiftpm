//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/08.
//

import SwiftUI
import Vision

//struct ElephantCompareView: View {
//
//    @Binding var simili: Double
//    @State var isDrawingActive = false //
//    @State private var isLoading = false
//    @Binding var captureImage: Image?
//
//    @State private var simility: Bool = false
//    @Binding var isPresented: Bool
//    @State private var isElephantDetailActive: Bool = false
//
//    @State private var opacityArray: [Double] = [0, 0, 0, 0, 0, 0]
//    @State private var isCalculatingSimilarity = false
//    @State private var ShowResultActive = false
//
//    var body: some View {
//
//        let image: UIImage = captureImage.asUIImage()
//
//
//        GeometryReader { geometry in
//            NavigationView{
//                //                GeometryReader {  geometry in
//                ZStack{
//                    NavigationLink(destination: ElephantDetailView(), isActive: $isElephantDetailActive){
//                        Button(action: {
//                            withAnimation(.easeInOut){
//                                isElephantDetailActive = true
//                            }
//                        }, label: {
//                            Text("skip")
//                                .font(.system(size: 24))
//                                .fontWeight(.bold)
//                                .padding(.horizontal,40)
//                                .padding(.vertical,14)
//                                .foregroundColor(Color("MainColor"))
//                                .background {
//                                    Rectangle()
//                                        .stroke(Color("MainColor"),lineWidth: 5)
//                                        .cornerRadius(4)
//                                        .shadow(color: Color.black, radius: 1, y: 2)
//                                }
//
//                        })
//
//                    }
//                    .position(x: geometry.size.width/7, y: geometry.size.height/8)
//
//
//                    VStack {
//                        Text("Analyzing image similarity")
//                            .fontWeight(.black)
//                            .font(.system(size: 30))
//                            .foregroundColor(.black)
//                            .opacity(simility ? 1 : 0)
//                            .animation(.default)
//
//                        HStack {
//                            NavigationLink(destination: ElephantDetailView(), isActive: $isElephantDetailActive){
//                                Button(action: {
//                                    isElephantDetailActive = true
//                                }, label: {
//                                    VStack{
//
//
//
//
//
//                                    }.animation(.easeInOut)
//
//                                })
//                            }
//                            ForEach(0..<5, id: \.self) { index in
//                                Image("Ellipse \(14 + index)")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 50, height: 50)
//                                    .opacity(opacityArray[index]) // opacityArray 배열의 값에 따라 투명도 설정
//                                    .animation(.easeInOut)
//                                    .padding(10)
//                            }
//                        }
//                        //                            .onAppear {
//                        //                                // 뷰가 나타날 때 애니메이션 실행
//                        //                                for index in 0..<6 {
//                        //                                    // 0.2초 간격으로 각 원의 투명도를 1로 변경하여 나타나도록 애니메이션 설정
//                        //                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
//                        //                                        withAnimation {
//                        //                                            opacityArray[index] = 1
//                        //                                        }
//                        //                                    }
//                        //                                }
//                        //                            }
//
//                        Text("Shall we check if we drew well?\nIf it is not iPad Air 4&5th generation, it may not be recognized.")
//                            .fontWeight(.black)
//                            .font(.system(size: 30))
//                            .foregroundColor(.black)
//                            .opacity(simility ? 0 : 1)
//                            .animation(.default)
//
////                        Button(action: {
////                            // 버튼을 터치했을 때 비동기로 compareImageSimilarity 함수 호출
////                            // 이미지 비교 작업 수행
////                                self.simility = true
////                                withAnimation {
////                                    for index in 0..<6 {
////                                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
////                                            opacityArray[index] = 1 // opacityArray 배열의 값을 1로 변경하여 애니메이션 적용
////                                        }
////                                    }
////                                }
////                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
////                                    guard let img2 = UIImage(named: "Elephant2") else { return }
////                                    print("---> img1: \(image.size)  img2: \(img2.size)")
////                                    if let percent = compareImages(image1: image, image2: img2) {
////                                        // 계산이 완료되면 메인 스레드에서 UI 업데이트
////                                        print("----> percent: \(percent) \n")
////                                        simili = percent
////                                        print("----> simili: \(simili) \n")
////
////
////                                    }
////                                }
////
////
////                        }) {
////                            let _ = print("dlfkajsdlkf"+String(simility))
////
////                            Text("Check")
////                                .font(.system(size: 24))
////                                .fontWeight(.bold)
////                                .padding(.horizontal,40)
////                                .padding(.vertical,14)
////                                .foregroundColor(.white)
////                                .background {
////                                    Rectangle()
////                                        .fill(Color("MainColor"))
////                                        .cornerRadius(20)
////                                        .shadow(color: Color.black, radius: 1, y: 2)
////                                }
////                                .animation(.default)
////
////
////                        }.opacity(simility ? 0 : 1)
//
//                        //                Button(action: {
//                        //
//                        //                }, label: {
//                        //                    Text("성공 \(simili)")
//                        //                        .opacity(simility ? 1 : 0)
//                        //                })
//
//                        Button(action: {
//                            // 버튼을 터치했을 때 비동기로 compareImageSimilarity 함수 호출
//                            // 이미지 비교 작업 수행
//                            ShowResultActive = true
//                            isCalculatingSimilarity = true
//                            withAnimation {
//                                for index in 0..<6 {
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
//                                        opacityArray[index] = 1 // opacityArray 배열의 값을 1로 변경하여 애니메이션 적용
//                                    }
//                                }
//                            }
//                            DispatchQueue.main.async {
//                                guard let img2 = UIImage(named: "GorillaDetailPicture") else { return }
//                                print("---> img1: \(image.size)  img2: \(img2.size)")
//                                if let percent = compareImages(image1: image, image2: img2) {
//                                    // 계산이 완료되면 메인 스레드에서 UI 업데이트
//                                    print("----> percent: \(percent) \n")
//                                    simili = percent
//                                    print("----> simili: \(simili) \n")
//
//                                    if simili >= 51.8 {
//                                        print("simility = Rhino \(simility)")
//                                    }
//                                    isCalculatingSimilarity = false // 계산이 완료되면 isCalculatingSimilarity를 false로 설정
//                                }
//                            }
//                        }) {
//                            let _ = print("ㄹㅎ옿ㄹ"+String(simility))
//
//                            Text(ShowResultActive ?"One More Click" :"Check")
//                                .font(.system(size: 24))
//                                .fontWeight(.bold)
//                                .padding(.horizontal,40)
//                                .padding(.vertical,14)
//                                .foregroundColor(.white)
//                                .background {
//                                    Rectangle()
//                                        .fill(Color("MainColor"))
//                                        .cornerRadius(20)
//                                        .shadow(color: Color.black, radius: 1, y: 2)
//                                }
//                                .animation(.default)
//                        }.opacity(simility || isCalculatingSimilarity ? 0 : 1)
//
//
//                        if simili >= 52.51 {
//                            NavigationLink(destination: ElephantDetailView(), isActive: $isElephantDetailActive){
//                                Button(action: {
//                                    isElephantDetailActive = true
//                                }, label: {
//                                    VStack{
//
//                                        Image("👍")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: geometry.size.width/4 , height: geometry.size.height/4)
//
//                                        Text("Good drawing!")
//                                            .font(.system(size: 24))
//                                            .fontWeight(.bold)
//                                            .padding(.horizontal,40)
//                                            .padding(.vertical,14)
//                                            .foregroundColor(Color("MainColor"))
//
//                                        Text("Pass")
//                                            .font(.system(size: 24))
//                                            .fontWeight(.bold)
//                                            .padding(.horizontal,40)
//                                            .padding(.vertical,14)
//                                            .foregroundColor(Color("SubColor"))
//                                            .background {
//                                                Rectangle()
//                                                    .fill(Color("MainColor"))
//                                                    .cornerRadius(20)
//                                                    .shadow(color: Color.black, radius: 1, y: 2)
//                                            }
//
//                                    }.animation(.easeInOut)
//
//                                })
//                            }
//
//                        } else if simili > 1 && simili < 52.51{
//                            Button(action: {
//                                simili = 0.0
//                                withAnimation(.easeInOut){
//                                    isPresented = false
//                                }
//
//                            }, label: {
//                                VStack{
//                                    Image("❌")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: geometry.size.width/4 , height: geometry.size.height/4)
//
//                                    Text("Sorry, but the picture isn't similar\nTry drawing it again!")
//                                        .font(.system(size: 24))
//                                        .fontWeight(.bold)
//                                        .padding(.horizontal,40)
//                                        .padding(.vertical,14)
//                                        .foregroundColor(Color("RedColor"))
//                                    Text("do it again")
//                                        .font(.system(size: 24))
//                                        .fontWeight(.bold)
//                                        .padding(.horizontal,40)
//                                        .padding(.vertical,14)
//                                        .foregroundColor(Color("MainColor"))
//                                        .background {
//                                            Rectangle()
//                                                .fill(Color("SubColor"))
//                                                .cornerRadius(20)
//                                                .shadow(color: Color.black, radius: 1, y: 2)
//                                        }
//                                        .navigationBarBackButtonHidden(true)
//                                }.animation(.easeInOut)
//                            })
//                        } else{
//
//                        }
//
//
//                    }
//                }
//                //                }
//
//            }
//            .navigationBarBackButtonHidden(true)
//            .navigationViewStyle(StackNavigationViewStyle())
//        }
//
//
//
//
//
//
//    }
//
//
//    func findColors(_ image: UIImage) -> [UIColor] {
//
//        let pixelsWide = Int(image.size.width)
//        let pixelsHigh = Int(image.size.height)
//
//
//        guard let pixelData = image.cgImage?.dataProvider?.data else { return [] }
//        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
//
//        var imageColors: [UIColor] = []
//        for x in 0..<pixelsWide {
//            for y in 0..<pixelsHigh {
//                let point = CGPoint(x: x, y: y)
//                let pixelInfo: Int = ((pixelsWide * Int(point.y)) + Int(point.x)) * 4
//                let color = UIColor(red: CGFloat(data[pixelInfo]) / 255.0,
//                                    green: CGFloat(data[pixelInfo + 1]) / 255.0,
//                                    blue: CGFloat(data[pixelInfo + 2]) / 255.0,
//                                    alpha: CGFloat(data[pixelInfo + 3]) / 255.0)
//                imageColors.append(color)
//            }
//        }
//        return imageColors
//    }
//
//    func compareImages(image1: UIImage, image2: UIImage) -> Double? {
//        let data1 = findColors(image1)
//        let data2 = findColors(image2)
//        guard data1.count == data2.count else { return nil }
//        var similarr = [Bool]()
//        for i in data1.indices {
//            similarr.append(isRGBSimilar(data1[i], data2[i], 0.1)) // <-- set epsilon
//        }
//        let simi = similarr.filter{$0}
//        let result = (Double(simi.count * 100) / (Double(image1.size.width) * Double(image1.size.height)))
//        return result
//    }
//
//    // compare 2 colors to be within d of each other
//    func isRGBSimilar(_ f: UIColor, _ t: UIColor, _ d: CGFloat) -> Bool {
//        var r1: CGFloat = 0; var g1: CGFloat = 0; var b1: CGFloat = 0; var a1: CGFloat = 0
//        f.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
//
//        var r2: CGFloat = 0; var g2: CGFloat = 0; var b2: CGFloat = 0; var a2: CGFloat = 0
//        t.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
//
//        return abs(r1 - r2) <= d && abs(g1 - g2) <= d && abs(b1 - b2) <= d &&  abs(a1 - a2) <= d
//    }
//
//}

struct ElephantCompareView: View {
    
    @Binding var simili: Double
    @State var isDrawingActive = false
    @State private var isLoading = false
    @Binding var captureImage: Image?
    
    @State private var simility: Bool = false
    @Binding var isPresented: Bool
    @State private var isGorillaActive: Bool = false
    
    @State private var opacityArray: [Double] = [0, 0, 0, 0, 0, 0]
    
    @State private var isCalculatingSimilarity = false
    
    @State private var ShowResultActive = false
    
    var body: some View {
        
        let image: UIImage = captureImage.asUIImage()
        
        
        GeometryReader { geometry in
            NavigationView{
                //                GeometryReader {  geometry in
                ZStack{

                    
                    VStack {
                        Text("Analyzing image similarity")
                            .fontWeight(.black)
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .opacity(simility ? 1 : 0)
                            .animation(.default)

                        HStack {
                            ForEach(0..<5, id: \.self) { index in
                                Image("Ellipse \(14 + index)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .opacity(opacityArray[index]) // opacityArray 배열의 값에 따라 투명도 설정
                                    .animation(.easeInOut)
                                    .padding(10)
                            }
                        }
                        //                            .onAppear {
                        //                                // 뷰가 나타날 때 애니메이션 실행
                        //                                for index in 0..<6 {
                        //                                    // 0.2초 간격으로 각 원의 투명도를 1로 변경하여 나타나도록 애니메이션 설정
                        //                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                        //                                        withAnimation {
                        //                                            opacityArray[index] = 1
                        //                                        }
                        //                                    }
                        //                                }
                        //                            }
                        
                        Text("Shall we check if we drew well?")
                            .fontWeight(.black)
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .opacity(simility ? 0 : 1)
                            .animation(.default)
                        
//                        Button(action: {
//                            // 버튼을 터치했을 때 비동기로 compareImageSimilarity 함수 호출
//                            // 이미지 비교 작업 수행
//                            self.simility = true
//                            withAnimation {
//                                for index in 0..<6 {
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
//                                        opacityArray[index] = 1 // opacityArray 배열의 값을 1로 변경하여 애니메이션 적용
//                                    }
//                                }
//                            }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
//                                guard let img2 = UIImage(named: "GorillaDetailPicture") else { return }
//                                print("---> img1: \(image.size)  img2: \(img2.size)")
//                                if let percent = compareImages(image1: image, image2: img2) {
//                                    // 계산이 완료되면 메인 스레드에서 UI 업데이트
//                                    print("----> percent: \(percent) \n")
//                                    simili = percent
//                                    print("----> simili: \(simili) \n")
//
//                                    if simili >= 51.8 {
//                                        print("simility = Rhino \(simility)")
//                                    }
//                                }
//                            }
//                        }) {
//                            let _ = print("ㄹㅎ옿ㄹ"+String(simility))
//
//                            Text("Check")
//                                .font(.system(size: 24))
//                                .fontWeight(.bold)
//                                .padding(.horizontal,40)
//                                .padding(.vertical,14)
//                                .foregroundColor(.white)
//                                .background {
//                                    Rectangle()
//                                        .fill(Color("MainColor"))
//                                        .cornerRadius(20)
//                                        .shadow(color: Color.black, radius: 1, y: 2)
//                                }
//                                .animation(.default)
//
//
//                        }.opacity(simility ? 0 : 1)
                        
                        
                        
                        //                Button(action: {
                        //
                        //                }, label: {
                        //                    Text("성공 \(simili)")
                        //                        .opacity(simility ? 1 : 0)
                        //                })
                        
                        Button(action: {
                            // 버튼을 터치했을 때 비동기로 compareImageSimilarity 함수 호출
                            // 이미지 비교 작업 수행
                            ShowResultActive = true
                            isCalculatingSimilarity = true
                            withAnimation {
                                for index in 0..<6 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                                        opacityArray[index] = 1 // opacityArray 배열의 값을 1로 변경하여 애니메이션 적용
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                guard let img2 = UIImage(named: "Elephant2") else { return }
                                print("---> img1: \(image.size)  img2: \(img2.size)")
                                if let percent = compareImages(image1: image, image2: img2) {
                                    // 계산이 완료되면 메인 스레드에서 UI 업데이트
                                    print("----> percent: \(percent) \n")
                                    simili = percent
                                    print("----> simili: \(simili) \n")
                                    
                                    if simili >= 51.8 {
                                        print("simility = Rhino \(simility)")
                                    }
                                    isCalculatingSimilarity = false // 계산이 완료되면 isCalculatingSimilarity를 false로 설정
                                }
                            }
                        }) {
                            let _ = print("ㄹㅎ옿ㄹ"+String(simility))
                            
                            Text(ShowResultActive ?"If it doesn't work,\nclick one more time" :"Check")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .padding(.horizontal,40)
                                .padding(.vertical,14)
                                .foregroundColor(.white)
                                .background {
                                    Rectangle()
                                        .fill(Color("MainColor"))
                                        .cornerRadius(20)
                                        .shadow(color: Color.black, radius: 1, y: 2)
                                }
                                .animation(.default)
                        }.opacity(simility || isCalculatingSimilarity ? 0 : 1)

                        if simili >= 52.41 {
                            NavigationLink(destination: ElephantDetailView(), isActive: $isGorillaActive){
                                Button(action: {
                                    isGorillaActive = true
                                }, label: {
                                    VStack{
                                        
                                        Image("👍")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width/4 , height: geometry.size.height/4)
                                        
                                        Text("Good drawing!")
                                            .font(.system(size: 24))
                                            .fontWeight(.bold)
                                            .padding(.horizontal,40)
                                            .padding(.vertical,14)
                                            .foregroundColor(Color("MainColor"))
                                        
                                        Text("Pass")
                                            .font(.system(size: 24))
                                            .fontWeight(.bold)
                                            .padding(.horizontal,40)
                                            .padding(.vertical,14)
                                            .foregroundColor(Color("SubColor"))
                                            .background {
                                                Rectangle()
                                                    .fill(Color("MainColor"))
                                                    .cornerRadius(20)
                                                    .shadow(color: Color.black, radius: 1, y: 2)
                                            }
                                            
                                    }.animation(.easeInOut)
                                    
                                })
                            }
                            
                            
                        } else if simili > 1 && simili < 52.41{
                            
                            NavigationLink(destination: ElephantDetailView(), isActive: $isGorillaActive){
                                Button(action: {
                                    withAnimation(.easeInOut){
                                        isGorillaActive = true
                                    }
                                }, label: {
                                    VStack{
                                        Text("Maybe you draw well, but the app is wrong?")
                                            .font(.system(size: 14))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        Text("skip")
                                            .font(.system(size: 24))
                                            .fontWeight(.bold)
                                            .padding(.horizontal,40)
                                            .padding(.vertical,14)
                                            .foregroundColor(Color("MainColor"))
                                            .background {
                                                Rectangle()
                                                    .stroke(Color("MainColor"),lineWidth: 5)
                                                    .cornerRadius(4)
                                                    .shadow(color: Color.black, radius: 1, y: 2)
                                            }
                                    }


                                })
                                
                            }
                            .position(x: geometry.size.width/7, y: geometry.size.height/8)
                            
                            Button(action: {
                                withAnimation(.easeInOut){
                                    isPresented = false
                                }
                                simili = 0.0
                            }, label: {
                                VStack{
                                    Image("❌")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width/4 , height: geometry.size.height/4)
                                    
                                    Text("Sorry, but the picture isn't similar\nTry drawing it again!")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                        .padding(.horizontal,40)
                                        .padding(.vertical,14)
                                        .foregroundColor(Color("RedColor"))
                                    Text("do it again")
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
                                        .navigationBarBackButtonHidden(true)
                                }.animation(.easeInOut)
                            })
//                            .offset(y:-300)
                        } else{
                            
                        }
                        
                        
                    }
                }
                //                }
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        }

        
        
        
        
        
    }
    
    
    func findColors(_ image: UIImage) -> [UIColor] {
        
        let pixelsWide = Int(image.size.width)
        let pixelsHigh = Int(image.size.height)
        
        
        guard let pixelData = image.cgImage?.dataProvider?.data else { return [] }
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        var imageColors: [UIColor] = []
        for x in 0..<pixelsWide {
            for y in 0..<pixelsHigh {
                let point = CGPoint(x: x, y: y)
                let pixelInfo: Int = ((pixelsWide * Int(point.y)) + Int(point.x)) * 4
                let color = UIColor(red: CGFloat(data[pixelInfo]) / 255.0,
                                    green: CGFloat(data[pixelInfo + 1]) / 255.0,
                                    blue: CGFloat(data[pixelInfo + 2]) / 255.0,
                                    alpha: CGFloat(data[pixelInfo + 3]) / 255.0)
                imageColors.append(color)
            }
        }
        return imageColors
    }
    
    func compareImages(image1: UIImage, image2: UIImage) -> Double? {
        let data1 = findColors(image1)
        let data2 = findColors(image2)
        guard data1.count == data2.count else { return nil }
        
        let simi = data1.indices.filter {
            isRGBSimilar(data1[$0], data2[$0], 0.1) // <-- set epsilon
        }
        
        let result = Double(simi.count * 100) / Double(image1.size.width * image1.size.height)
        return result
    }

    
//    func compareImages(image1: UIImage, image2: UIImage) -> Double? {
//        let data1 = findColors(image1)
//        let data2 = findColors(image2)
//        guard data1.count == data2.count else { return nil }
//        var similarr = [Bool]()
//        for i in data1.indices {
//            similarr.append(isRGBSimilar(data1[i], data2[i], 0.1)) // <-- set epsilon
//        }
//        let simi = similarr.filter{$0}
//        let result = (Double(simi.count * 100) / (Double(image1.size.width) * Double(image1.size.height)))
//
//        return result
//    }
    
    // compare 2 colors to be within d of each other
    func isRGBSimilar(_ f: UIColor, _ t: UIColor, _ d: CGFloat) -> Bool {
        var r1: CGFloat = 0; var g1: CGFloat = 0; var b1: CGFloat = 0; var a1: CGFloat = 0
        f.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        
        var r2: CGFloat = 0; var g2: CGFloat = 0; var b2: CGFloat = 0; var a2: CGFloat = 0
        t.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return abs(r1 - r2) <= d && abs(g1 - g2) <= d && abs(b1 - b2) <= d &&  abs(a1 - a2) <= d
    }
    
}

extension View {
    // This function changes our View to UIView, then calls another function
    // to convert the newly-made UIView to a UIImage.
    public func asUIImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        // here is the call to the function that converts UIView to UIImage: `.asUIImage()`
        let image = controller.view.asUIImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
    // This is the function to convert UIView to UIImage
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}


struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}


