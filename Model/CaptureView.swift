//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/16.
//


//
//  RainbowView.swift
//  Over the Rainbow
//
//  Created by 하명관 on 2023/03/29.
//
import SwiftUI




// UIViewRepresentable을 통해 UIView에서 화면 캡처 기능을 사용할 수 있는 커스텀 뷰
//struct SnapshotView: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        return UIView()
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//    }
//
//    // 화면 캡처 메서드
//    func snapshot(of rect: CGRect) -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        context.translateBy(x: -rect.origin.x, y: -rect.origin.y)
//        UIApplication.shared.windows.first?.layer.render(in: context)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return image
//    }
//}
//
//struct SnapshotView: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        return UIView()
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//    }
//
//    // 화면 캡처 메서드
//    func snapshot(of rect: CGRect) -> UIImage? {
//        let format = UIGraphicsImageRendererFormat()
//        format.opaque = true
//        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1180.0, height: 840.0), format: format)
//        return renderer.image { (context) in
//            UIApplication.shared.windows.first?.layer.render(in: context.cgContext)
//        }
//    }
//}




//struct SnapshotView: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        return UIView()
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//    }
//
//    // 화면 캡처 메서드
//    func snapshot(of rect: CGRect) -> UIImage? {
//        let format = UIGraphicsImageRendererFormat()
//        format.opaque = true
//        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1180.0, height: 840.0), format: format)
//        return renderer.image { (context) in
//            let snapshotRect = CGRect(origin: .zero, size: rect.size)
//            let snapshotFrame = UIApplication.shared.windows.first?.safeAreaLayoutGuide.layoutFrame ?? snapshotRect
//            let scaleFactor = max(rect.width / snapshotFrame.width, rect.height / snapshotFrame.height)
//            context.cgContext.scaleBy(x: scaleFactor, y: scaleFactor)
//            context.cgContext.translateBy(x: -snapshotFrame.origin.x, y: -snapshotFrame.origin.y)
//            UIApplication.shared.windows.first?.layer.render(in: context.cgContext)
//        }
//    }
//}

struct SnapshotView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    // 화면 캡처 메서드
    func snapshot(of rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.translateBy(x: -rect.origin.x, y: -rect.origin.y)
        UIApplication.shared.windows.first?.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
