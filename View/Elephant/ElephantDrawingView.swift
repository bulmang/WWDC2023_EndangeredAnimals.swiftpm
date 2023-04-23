//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/08.
//

import SwiftUI

struct ElephantDrawingView: View {
    
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
    
    @State var drawButton: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("ElephantPicture")
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
                                selectedColor = Color("GreenColor")
                                black = false
                                gray = false
                                green = true
                            }, label: {
                                green
                                ? Image("SelectedGreen")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("Green")
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
                                selectedColor = Color("GrayColor")
                                gray = true
                                black = false
                                green = false
                            }, label: {
                                gray
                                ? Image("SelectedGray")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/30,height: geometry.size.height/20)
                                : Image("Gray")
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
                        
                        
                        NavigationLink(destination: ElephantCompareView( simili: $simili, captureImage: $captureImage, isPresented: $isPresented), isActive: $isPresented) {
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
                    //                                    .overlay(
                    //                                        Image("ElephantPicture")
                    //                                            .resizable()
                    //                                            .scaledToFit()
                    //                                            .frame(width: geometry.size.width)
                    //                                    )
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

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}




fileprivate
enum PopupStyle {
    case blur
    case dimmed
    case none
}

fileprivate
struct Popup<Message: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    var size: CGSize = CGSize(width: 200, height: 150)
    let style: PopupStyle
    let message: Message
    
    func body(content: Content) -> some View {
        content
            .blur(radius: style == .blur ? (isPresented ? 6 : 0) : 0)
            .overlay(
                Rectangle()
                    .fill(Color.black.opacity(style == .dimmed ? (isPresented ? 0.3 : 0) : 0))
            )
            .overlay(popupContent)
            .animation(.easeInOut(duration: 0.26), value: isPresented)
    }
    
    private var popupContent: some View {
        GeometryReader { proxy in
            ZStack {
                Color.clear
                VStack {
                    self.message
                }
                .frame(width: self.size.width, height: self.size.height)
                .background(Color.blue)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.5), radius: 12, x: 0, y: 0)
                .overlay(
                    ZStack {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark")
                                .font(.system(size: 16))
                                .padding(.trailing, 12)
                        }
                        self.topIcon
                    }
                    , alignment: .top)
            }
        }
        .scaleEffect(isPresented ? 1.0 : 0.85)
        .opacity(isPresented ? 1.0 : 0)
        .animation(.easeInOut(duration: 0.26), value: isPresented)
    }
    
    private var topIcon: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .overlay(
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
            )
            .offset(y: -20)
    }
}

fileprivate
struct PopupToggle: ViewModifier {
    
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .disabled(isPresented)
            .onTapGesture {
                self.isPresented.toggle()
            }
    }
}

fileprivate
extension View {
    
    func popup<T: View>(isPresented: Binding<Bool>,
                        size: CGSize = CGSize(width: 200, height: 150),
                        style: PopupStyle = .blur,
                        @ViewBuilder content: () -> T) -> some View {
        let popup = Popup(isPresented: isPresented, size: size, style: style, message: content())
        let popupToggle = PopupToggle(isPresented: isPresented)
        let modifiedContent = self.modifier(popup).modifier(popupToggle)
        return modifiedContent
    }
}
