//
//  MathView.swift
//  TestMathView
//
//  Created by Mike Griebling on 2022-02-14.
//

import SwiftUI
import SwiftMath

#if os(iOS)
struct MathView: UIViewRepresentable {

    var equation: String
    var background: Color = .clear
    var textAlignment: MTTextAlignment = .center
    var fontSize: CGFloat = 20
    var labelMode: MTMathUILabelMode = .text
    var insets: MTEdgeInsets = MTEdgeInsets()
    
    func makeUIView(context: Context) -> MTMathUILabel {
        let view = MTMathUILabel()
        return view
    }
    func updateUIView(_ uiView: MTMathUILabel, context: Context) {
        uiView.latex = equation
        uiView.fontSize = fontSize
        uiView.font = MTFontManager.manager.termesFont(withSize: fontSize)
        uiView.textAlignment = textAlignment
        uiView.labelMode = labelMode
        uiView.textColor = MTColor(Color.primary)
        uiView.contentInsets = insets
    }
}
#else
struct MathView: NSViewRepresentable {
    
    var equation: String
    var background: Color = .clear
    var textAlignment: MTTextAlignment = .center
    var fontSize: CGFloat = 30
    var labelMode: MTMathUILabelMode = .text
    var insets: MTEdgeInsets = MTEdgeInsets()
    
    func makeNSView(context: Context) -> MTMathUILabel {
        let view = MTMathUILabel()
        return view
    }
    
    func updateNSView(_ view: MTMathUILabel, context: Context) {
        view.latex = equation
        view.fontSize = fontSize
        view.font = MTFontManager().termesFont(withSize: fontSize)
        view.textAlignment = textAlignment
        view.labelMode = labelMode
        view.textColor = MTColor(Color.primary)
        view.contentInsets = insets
    }
}
#endif

