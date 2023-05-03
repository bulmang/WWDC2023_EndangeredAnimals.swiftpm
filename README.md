# WWDC2023-SSC

# Swift Student Challene란?

"Swift Student Challenge"는 애플의 WWDC (Worldwide Developers Conference)의 일환으로 매년 학생들을 대상으로하는 이벤트입니다. 이 챌린지는 학생들이 자신의 창의성을 발휘하여 Swift 언어로 iOS, macOS, watchOS 등의 애플 플랫폼에서 실행 가능한 앱 또는 playground를 개발하도록 장려합니다.👍

## 기획 의도

전 세계에 멸종위기동물을 알아보자 -> 경각심(멸종위기동물이 왜 멸종이 되는지)을 주자!

## 전달하고자 하는 메세지

멸종되는 원인이 무엇인지 생각하게 하자 

멸종되지 않게 하기 위해서 해야하는 행동을 전달해보자

## SSC를 하면서 내가 얻으려고 하였던 것

기획 🔵  / 디자인 🔵 🔵 / 개발 🔵 🔵 🔵 

### **기획**

- 다양한 주제가 있지만 평소에 내가 관심이 있는 분야 중 하나인 멸종위기동물을 선택하였다.
- 처음에는 전세계적 동물 중 여러 동물에 대해 소개를 하려고 하였지만 통일성이 없어 아프리카에 있는 멸종위기동물을 선정하였다. 기준은 아프리카에 있는 동물 + 크리티컬한 위험이 있는 멸종위기 동물
- 내가 전달하고자 하는 것을 잘 전달하기 위해 그림을 따라 그리도록 유도 하였습니다.
- 동물이 처한 상황에 대한 그림을 따라 그리게 하여 그 상황에 대해 더 생각을 해보고 집중할 수 있도록 만들고 싶었습니다.
    - 예시: 코끼리의 상아가 조각품,사치품에 비싸게 팔리기 때문에 죽는 현실, 코뿔소를 밀렵꾼에게 사냥 당하지 않기 위해 코뿔소의 뿔을 일부로 잘라버리는 모습 등
- 그림을 더 자세히 그리도록 유도하는 장치로는 이미지 유사치를 비교하는 장치를 만들었습니다.
- 유사치가 어느정도 넘으면 통과를 하고 실제 동물 사진과 그들의 상황과 관련된 정보를 넣었습니다.

### 디자인

- 평소에 디자인 UI/UX에 대한 관심은 있었지만 직접 찾아보거나 디자인 툴을 사용해보지 않았기 때문에 이번에 직접 디자인을 해봤습니다.
- 이번 프로젝트에 들어갈 component를 구현하기 위하여 Procreate(iPad app)로 그림을 그리고 Figma(Design Tool)을 이용하여 UI와 그림을 그렸습니다.
- Apple의 HIG(Human Interface Guidelines)라는 디자인 시스템을 참고하려고 했지만 시간이 부족하여 많이 참고하지 못하였습니다.

### 개발

- View
    - Intro
    - Main
    - Drawing
    - Compare
    - Animal(Elephant,Rhino,Gorilla)
- Model
    - Snapshot
    - DrawingEngine
    - Share
    - Intro
    - Tab
- ViewModel
    - DrawingViewModel

### 동작화면

- **Walkthrough**

<img src=https://user-images.githubusercontent.com/114594496/235953931-9cf6f922-c208-4c21-b507-aeca317cb9e5.gif width="350" height="250"/>



- **Fail**
    
<img src= https://user-images.githubusercontent.com/114594496/235954016-3df954e9-b7b4-4660-a24f-3f8d43006562.gif  width="350" height="250"/>



- **Success**

<img src= https://user-images.githubusercontent.com/114594496/235953984-d0518c9b-1335-4c37-a5c2-c34bb68c5cfd.gif width="350" height="250"/>




- Detail

<img src= https://user-images.githubusercontent.com/114594496/235954041-1b53f207-f359-48e9-a83b-79fc55c1dbfe.gif width="350" height="250"/>




### 코드

### 비교하는 함수

```swift
// 주어진 이미지에서 모든 픽셀의 색상 값을 추출하여 UIColor 배열로 반환
    func findColors(_ image: UIImage) -> [UIColor] {
            
            let pixelsWide = Int(image.size.width)  // 이미지의 가로 픽셀 수
            let pixelsHigh = Int(image.size.height) // 이미지의 세로 픽셀 수
            
            // 이미지 데이터 가져오기
            // 이미지에서 픽셀 데이터를 가져올 수 있는지 검사, optional를 사용하여 속성 값이 없을때 에러나는 걸 방지
            // cgImage는  CoreGraphics비트, datap=Provider는 cgImage에서 비트맵 이미지 데이터를 생성하기 위해 데이터 공급자에 대한 정보를 제공
            guard let pixelData = image.cgImage?.dataProvider?.data else { return [] }
            // CFDataGetBytePtr는 pixelData에 저장된 이미지 데이터의 첫 번째 바이트를 가리키는 포인터 생성,CFData를 UInt8 버퍼로 반환
            let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
            
            var imageColors: [UIColor] = [] // 이미지의 모든 색상을 담을 배열
        
            // image객체의 모든 픽셀 색상을 가져와서 UIColor 객체로 변환하여 imageColors 배열에 추가
            for x in 0..<pixelsWide {
                for y in 0..<pixelsHigh {
                    let point = CGPoint(x: x, y: y)
                    // x,y좌표에 해당하는 픽셀의 색상 정보를 가져옴, 계산식을 사용하면 현재 좌표애 해당하는 픽셀 위치를 구함
                    // 4를 곱한 이유는 각각의 픽셀의색상정보(RGBA)를 4byte로 저장하기 떄문
                    let pixelInfo: Int = ((pixelsWide * Int(point.y)) + Int(point.x)) * 4
                    let color = UIColor(red: CGFloat(data[pixelInfo]) / 255.0,
                                        green: CGFloat(data[pixelInfo + 1]) / 255.0,
                                        blue: CGFloat(data[pixelInfo + 2]) / 255.0,
                                        alpha: CGFloat(data[pixelInfo + 3]) / 255.0)
                    imageColors.append(color) // 이미지의 색상을 배열에 추가
                }
            }
            return imageColors // 모든 색상이 담긴 배열 반환
        }
    
    // findColors함수를 사용하여 두 이미지 색상 데이터를 추출한 다음, 두 이미지의 사이즈가 같을 경우 픽셀의 유사도를 비교
    func compareImages(image1: UIImage, image2: UIImage) -> Double? {
        
        let data1 = findColors(image1)
        let data2 = findColors(image2)
        
        // 두 데이터의 길이가 다르면 이미지 데이터가 다르기 떼문에 nil 반환
        guard data1.count == data2.count else { return nil }
        
        //  data1과 data2 두 개의 이미지 데이터의 RGB 값을 비교하여, 일정 값(epsilon) 이내로 유사한 경우에 대한 인덱스를 구하는 코드
        let simi = data1.indices.filter {
            isRGBSimilar(data1[$0], data2[$0], 0.1) // <-- set epsilon 
        }
        
        // 유사치 결과 출력
        let result = Double(simi.count * 100) / Double(image1.size.width * image1.size.height)
        return result
    }
 
    // 입력된 두 개의 UIColor객체가 RGB값 차이가 일정 수치 이내로 유사한지를 판별하는 함수
    func isRGBSimilar(_ f: UIColor, _ t: UIColor, _ d: CGFloat) -> Bool {
        
        // 첫 번째 UIColor 객체의 RGBA값 추출
        var r1: CGFloat = 0; var g1: CGFloat = 0; var b1: CGFloat = 0; var a1: CGFloat = 0
        f.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        
        // 두 번째 UIColor 객체의 RGBA값 추출
        var r2: CGFloat = 0; var g2: CGFloat = 0; var b2: CGFloat = 0; var a2: CGFloat = 0
        t.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        // 두 UIColor 객체의 각 RGBA 값 차이가 입력된 d 값 이내인지 판별하여 결과 반환
        return abs(r1 - r2) <= d && abs(g1 - g2) <= d && abs(b1 - b2) <= d &&  abs(a1 - a2) <= d
    }
```

### 그림그리기

```swift

import Foundation
import SwiftUI

class DrawingEngine {
    
    
    // Path는 곡선, 다각형 도형을 그리기 위한 객체, CGPoint는 x , y 좌표 값을 가지고 주로 그래픽 처리에 사용 화면좌표계
    func createPath(for points: [CGPoint]) -> Path {
        
        var path = Path()
        
        
        // 첫번째 점을 시작점
        if let firstPoint = points.first {
            path.move(to: firstPoint)
        }
        
        // 중간점을 계산하고, 이전 점과 중간점, 그리고 현재 점을 이용해 곡선을 그림
        for index in 1..<points.count {
            let mid = calculateMidPoint(points[index - 1], points[index])
            path.addQuadCurve(to: mid, control: points[index - 1])
        }
        
        // 마지막 점 선을 추가
        if let last = points.last {
            path.addLine(to: last)
        }
        
        return path
    }
    
    
    // 두 점 사이의 중간점을 계산
    func calculateMidPoint(_ point1: CGPoint, _ point2: CGPoint) -> CGPoint {
        let newMidPoint = CGPoint(x: (point1.x + point2.x)/2, y: (point1.y + point2.y)/2)
        return newMidPoint
    }
}

struct DrawingShape: Shape {
    // 그려지는 점을 배열에 넣고
    let points: [CGPoint]
    let engine = DrawingEngine()
    
    // 그림을 그릴 때 사용
    func path(in rect: CGRect) -> Path {
        engine.createPath(for: points)
    }
}

struct Line: Identifiable {
    
    // 그려지는 점 배열
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat

    let id = UUID()
}
```

## 개발하면서 문제였던 것들

- Iamge를 UIImage로 변환(Image to UIImage)
    - 유저가 그린 그림을 캡처하기 위하여 Snapshot을 이용하였다. 캡처한 이미지를 변수에 넣고 비교하는 함수에 전달을 하려고 하였다. 비교하는 함수에 사용하기 위해서는 Image를 UIImage로 변경해줘야 했는데 그 부분에서 시간이 소요가 되었다.
    - 해결방법
        - UIView를 이용하여 컨트롤러의 뷰 프레임을 설정하고 컨트롤러의 사이즈를 설정하여 적절한 뷰의 크기에 맞추었다, UIView를 UIImage로 변환하는 함수를 호출하고 VIew를 제거하였다.
            
            ```swift
            extension View {
                public func asUIImage() -> UIImage {
                    
                    let controller = UIHostingController(rootView: self)
                    
                    // 컨트롤러의 뷰 프레임을 설정
                    controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
                    UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
                    
                    // 컨트롤러의 사이즈를 설정하고 뷰를 적절한 크기에 맞춤.
                    let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
                    controller.view.bounds = CGRect(origin: .zero, size: size)
                    controller.view.sizeToFit()
                    
                    // UIView를 UIImage로 변환하는 함수 `.asUIImage()`를 호출
                    let image = controller.view.asUIImage()
            
                    // View를 윈도우에서 제거
                    controller.view.removeFromSuperview()
                    return image
                }
            }
            
            extension UIView {
                // UIVIew를 UIImage로 변환
                public func asUIImage() -> UIImage {
                    let renderer = UIGraphicsImageRenderer(bounds: bounds)
                    return renderer.image { rendererContext in
                        layer.render(in: rendererContext.cgContext)
                    }
                }
            }
            ```
            
- iPad마다 다른 화면크기
    - 기기의 사이즈가 각각 달라 캡처 이미지의 사이즈도 달랐다. 내가 저장해 놓은 이미지에 대한 유사치를 비교하려면 같은 사이즈여야 하는데 다른 사이즈였기 때문에 같은 사이즈로 만들려고 노력하였습니다
    - **`let** capturedImage = snapshotView.snapshot(of: CGRect(x: 0, y: 0, width: 1180, height: 820))`
- 낮은 이미지 유사치 정확도(Low Image similarity accuracy)
    - 이미지 분석을 하기 위하여 기기의 사이즈를 가져와 pixel에 대한 RGB값을 받아 비교하는 형식으로 하였는데 이미지끼리는 분석이 잘 되었지만 그림을 그린상황에서 비교하는 것에 대한 정확도가 낮아서 아쉬웠습니다.
- 뷰간의 의존성 처리에 관련문제(**AttributeGraph: cycle detected through attribute)**
    - SwiftUI의 뷰 간 연결 그래프에서 사이클이 발생하여 무한루프 발생
    - 해결방안으로 버튼을 두 번 클릭하게 하여 변수값을 초기화 시키는 방법 `deinit`
    - 의존성이 서로 순환되면서 발생하는 문제
- Memory Leak
    - 네비게이션 스택이 계속 쌓여있어서 메모리가 계속 많이 잡히는 현상이 일어남. 네비게이션 스택을 초기
