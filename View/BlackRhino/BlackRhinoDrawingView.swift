//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/19.
//

import SwiftUI

struct BlackRhinoDrawingView: View {
    
    @State var simili = 0.0
    @Binding var isElephantActive: Bool
    @State var isCompareActive: Bool = false
    @State var isPresented: Bool = false
    
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    
    @State private var selectedColor: Color = .black
    @State private var selectedLineWidth: CGFloat = 1
    @State var currentSize: String = "black"
    
    @State var small:Bool = true
    @State var middle:Bool = false
    @State var large:Bool = false
    @State var xlarge:Bool = false
    
    @State var black:Bool = true
    @State var gray:Bool = false
    @State var green:Bool = false
    
    let engine = DrawingEngine()
    @State private var showConfirmation: Bool = false
    @State private var guide:Bool = false
    
    @State var captureImage: Image?
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("BlackRhinoPicture")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                
                VStack {
                    HStack(spacing: 10) {
                        
                        
                        Button {
                            // Closing View...
                            withAnimation(.easeInOut){
                                isElephantActive = false
                            }
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                                .font(.title2)
                                .foregroundColor(Color.black.opacity(0.7))
                                .navigationBarBackButtonHidden(true)
                        }
                        .padding(.trailing,80)
                        
                        
                        HStack(spacing: 20){
                            
                            ColorPicker("line color", selection: $selectedColor)
                                .labelsHidden()
                            
                            Button(action: {
                                selectedColor = Color("BrownColor")
                                black = false
                                gray = false
                                green = true
                            }, label: {
                                green
                                ? Image("SelectedBrown")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("Brown")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            })
                            
                            
                            
                            Button(action: {
                                selectedColor = .black
                                black = true
                                gray = false
                                green = false
                            }, label: {
                                black
                                ? Image("SelectedBlack")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("Black")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            })
                            
                            Button(action: {
                                selectedColor = Color("RedGrayColor")
                                gray = true
                                black = false
                                green = false
                            }, label: {
                                gray
                                ? Image("SelectedRedGray")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("RedGray")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            })
                            .padding(.trailing,100)
                            
                            Button(action: {
                                selectedLineWidth = 5
                                small = true
                                middle = false
                                large = false
                                xlarge = false
                            }, label: {
                                small
                                ? Image("SelectedSmallBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("SmallBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            })
                            
                            Button(action: {
                                selectedLineWidth = 10
                                small = false
                                middle = true
                                large = false
                                xlarge = false
                            }, label: {
                                middle
                                ? Image("SelectedMiddleBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("MiddleBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            })
                            
                            Button(action: {
                                selectedLineWidth = 15
                                large = true
                                small = false
                                middle = false
                                xlarge = false
                            }, label: {
                                large
                                ? Image("SelectedLargeBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("LargeBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            })
                            
                            Button(action: {
                                selectedLineWidth = 35
                                large = false
                                small = false
                                middle = false
                                xlarge = true
                            }, label: {
                                xlarge
                                ? Image("SelectedXLargeBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("XLargeBrush")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            })
                        }
                        .padding(.trailing,100)
                        
                        
                        Button {
                            let last = lines.removeLast()
                            deletedLines.append(last)
                        } label: {
                            lines.count == 0
                            ? Image("EmptyArrowBackword")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            : Image("ArrowBackword")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            
                        }.disabled(lines.count == 0)
                        
                        Button {
                            let last = deletedLines.removeLast()
                            lines.append(last)
                        } label: {
                            deletedLines.count == 0
                            ? Image("EmptyArrowForward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                            : Image("ArrowForward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                        }.disabled(deletedLines.count == 0)
                        
                        Button(action: {
                            showConfirmation = true
                        }) {
                            Image("Delete")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                        }
                        .confirmationDialog(Text("Are you sure you want to delete everything?"), isPresented: $showConfirmation) {
                            
                            Button("Delete", role: .destructive) {
                                lines = [Line]()
                                deletedLines = [Line]()
                            }
                        }
                        .padding(.trailing,100)
                        
                        //                    Button(action: {
                        //                        captureScreen()
                        //                    }) {
                        //                        Image("Submit")
                        //                            .resizable()
                        //                            .scaledToFit()
                        //                            .frame(width: geometry.size.width/10,height: geometry.size.height/20)
                        //                    }.foregroundColor(.blue)
                        
                        
                        NavigationLink(destination: BlackRhinoCompareView( simili: $simili, captureImage: $captureImage, isPresented: $isPresented), isActive: $isPresented) {
                            Button(action: {
                                captureScreen()
                                isPresented = true
                                //                                    isCompareActive = true
                            }) {
                                Image("Submit")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/10,height: geometry.size.height/20)
                            }
                        }
                        
                        
                        
                    }
                    .padding(.horizontal,10)
                    .padding(.vertical,20)
                    //                    .sheet(isPresented: $isCompareActive){
                    //                        CompareView(simili: $simili, captureImage: $captureImage, isCompareActive: $isCompareActive)
                    //                    }
                    
                    
                    
                    ZStack {
                        
                        Color.white.opacity(0.1)
                        
                        ForEach(lines){ line in
                            DrawingShape(points: line.points)
                                .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
                        }
                        
                    }
//                                                        .overlay(
//                                                            Image("BlackRhinoPicture")
//                                                                .resizable()
//                                                                .scaledToFit()
//                                                                .frame(width: geometry.size.width)
//                                                        )
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                        let newPoint = value.location
                        if value.translation.width + value.translation.height == 0 {
                            //TODO: use selected color and linewidth
                            lines.append(Line(points: [newPoint], color: selectedColor, lineWidth: selectedLineWidth))
                        } else {
                            let index = lines.count - 1
                            lines[index].points.append(newPoint)
                        }
                        
                    }).onEnded({ value in
                        if let last = lines.last?.points, last.isEmpty {
                            lines.removeLast()
                        }
                    })
                             
                    )
                    
                }

            }
        }
        
        
        
        
    }
    
    //    private func captureScreen() {
    //        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
    //        let bounds = window?.bounds ?? UIScreen.main.bounds
    //
    //        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
    //
    //        window?.drawHierarchy(in: bounds, afterScreenUpdates: true)
    //
    //        let image = UIGraphicsGetImageFromCurrentImageContext()
    //        UIGraphicsEndImageContext()
    //
    //        if let uiImage = image {
    //            captureImage = Image(uiImage: uiImage)
    //
    //        }
    //    }
    
//    private func captureScreen() {
//        // SnapshotView를 통해 화면 캡처
//        let snapshotView = SnapshotView()
//        let capturedImage = snapshotView.snapshot(of: UIScreen.main.bounds)
//
//        // UIImage를 Image로 변환하여 captureImage에 저장
//        if let uiImage = capturedImage {
//            captureImage = Image(uiImage: uiImage)
//        }
//    }
    private func captureScreen() {
        // SnapshotView를 통해 화면 캡처
        let snapshotView = SnapshotView()
//        let capturedImage = snapshotView.snapshot(of: UIScreen.main.bounds)
        let capturedImage = snapshotView.snapshot(of: CGRect(x: 0, y: 0, width: 1180, height: 820))
        
        // UIImage를 Image로 변환하여 captureImage에 저장
        if let uiImage = capturedImage {
            captureImage = Image(uiImage: uiImage)
        }
    }
    
}

struct BlackRhinoDrawingView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
