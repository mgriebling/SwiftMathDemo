//
//  ContentView.swift
//  SwiftMathDemo
//
//  Created by Mike Griebling on 2023-01-18.
//

import SwiftUI
import SwiftMath

struct ContentView: View {
    
    /// Set to *true* to preview the fonts
    let previewFonts = false
    
    let demoLabels = [
		"x_i\\in[-1{,}5;1,5]",
		"\\text{Accented characters: áéíóúýàèìòùâêîôûäëïöüÿãñõ}",
		"\\text{Special: çøåæœß'ÇØÅÆŒ}",
		"\\text{Uppercase: ÁÉÍÓÚÝÀÈÌÒÙÂÊÎÔÛÄËÏÖÜÃÑÕ}",
		"\\text{Accents: \\hat{o}, \\check{o}, \\tilde{o}, \\acute{i}, \\grave{o}, \\ddot{o}, \\dot{o}, \\breve{o}, `, \", \\upquote}, \\aa",
        "\\text{Quadratic roots: }x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}",
        "\\color{#ff3399}{(a_1+a_2)^2}=a_1^2+2a_1a_2+a_2^2",
        "\\cos(\\theta + \\varphi) = \\cos(\\theta)\\cos(\\varphi) - \\sin(\\theta)\\sin(\\varphi)",
        """
        \\frac{1}{\\left(\\sqrt{\\phi \\sqrt{5}}-\\phi\\right) e^{\\frac25 \\pi}} 
            = 1+\\frac{e^{-2\\piā} {1 +\\frac{e^{-4\\pi}} {1+\\frac{e^{-6\\pi}} {1+\\frac{e^{-8\\pi}} {1+\\cdots} } } }
        """,
        "\\sigma = \\sqrt{\\frac{1}{N}\\sum_{i=1}^N (x_i - \\mu)^2}",
        "\\neg(P\\land Q) \\iff (\\neg P)\\lor(\\neg Q)",
        "\\log_b(x) = \\frac{\\log_a(x)}{\\log_a(b)}",
        "\\lim_{x\\to\\infty}\\left(1 + \\frac{k}{x}\\right)^x = e^k",
        "\\int_{-\\infty}^\\infty \\! e^{-x^2} dx = \\sqrt{\\pi}",
        "\\frac 1 n \\sum_{i=1}^{n}x_i \\geq \\sqrt[n]{\\prod_{i=1}^{n}x_i}",
        "f^{(n)}(z_0) = \\frac{n!}{2\\pi i}\\oint_\\gamma\\frac{f(z)}{(z-z_0)^{n+1}}\\,dz",
        "i\\hbar\\frac{\\partial}{\\partial t}\\mathbf\\Psi(\\mathbf{x},t) = " +
                               "-\\frac{\\hbar}{2m}\\nabla^2\\mathbf\\Psi(\\mathbf{x},t) + V(\\mathbf{x})\\mathbf\\Psi(\\mathbf{x},t)",
        "\\left(\\sum_{k=1}^n a_k b_k \\right)^2 \\le \\left(\\sum_{k=1}^n a_k^2\\right)\\left(\\sum_{k=1}^n b_k^2\\right)",
        "{n \\brace k} = \\frac{1}{k!}\\sum_{j=0}^k (-1)^{k-j}\\binom{k}{j}(k-j)^n",
        "f(x) = \\int\\limits_{-\\infty}^\\infty\\!\\hat f(\\xi)\\,e^{2 \\pi i \\xi x}\\,\\mathrm{d}\\xi",
        """
            \\begin{gather}
               \\dot{x} = \\sigma(y-x) \\\\
               \\dot{y} = \\rho x - y - xz \\\\
               \\dot{z} = -\\beta z + xy
            \\end{gather}
        """,
        """
        \\vec \\bf V_1 \\times \\vec \\bf V_2 =  
            \\begin{vmatrix}
                \\hat \\imath &\\hat \\jmath &\\hat k \\\\
                \\frac{\\partial X}{\\partial u} & \\frac{\\partial Y}{\\partial u} & 0 \\\\
                \\frac{\\partial X}{\\partial v} & \\frac{\\partial Y}{\\partial v} & 0
            \\end{vmatrix}
        """,
        """
        \\begin{eqalign}
            \\nabla \\cdot \\vec{\\bf{E}} & = \\frac {\\rho} {\\varepsilon_0} \\\\
            \\nabla \\cdot \\vec{\\bf{B}} & = 0 \\\\
            \\nabla \\times \\vec{\\bf{E}} &= - 
                \\frac{\\partial\\vec{\\bf{B}}}{\\partial t} \\\\
            \\nabla \\times \\vec{\\bf{B}} & = \\mu_0\\vec{\\bf{J}} + 
                \\mu_0\\varepsilon_0 \\frac{\\partial\\vec{\\bf{E}}}{\\partial t}
        \\end{eqalign}
        """,
        """
        \\begin{pmatrix}
            a & b\\\\ c & d
        \\end{pmatrix}
        \\begin{pmatrix}
            \\alpha & \\beta \\\\ \\gamma & \\delta
        \\end{pmatrix} = 
        \\begin{pmatrix}
            a\\alpha + b\\gamma & a\\beta + b \\delta \\\\
            c\\alpha + d\\gamma & c\\beta + d \\delta 
        \\end{pmatrix}
        """,
        """
        \\frak Q(\\lambda,\\hat{\\lambda}) = 
            -\\frac{1}{2} \\mathbb P(O \\mid \\lambda ) \\sum_s \\sum_m \\sum_t \\gamma_m^{(s)} (t) + \\\\
            \\quad \\left( \\log(2 \\pi ) + \\log \\left| \\cal C_m^{(s)} \\right| + 
            \\left( o_t - \\hat{\\mu}_m^{(s)} \\right) ^T \\cal C_m^{(s)-1} \\right) 
        """,
        """
        f(x) = \\begin{cases}
                    \\frac{e^x}{2} & x \\geq 0 \\\\
                    1 & x < 0
               \\end{cases}
        """,
        """
        \\color{#ff3333}{c}\\color{#9933ff}{o}\\color{#ff0080}{l}+
        \\color{#99ff33}{\\frac{\\color{#ff99ff}{o}} {\\color{#990099}{r}}}-\\color{#33ffff}{\\sqrt[\\color{#3399ff}{e}]{\\color{#3333ff}{d}}}
        """
    ]
    let r20 = MTEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    let z = MTEdgeInsets()
    let back = Color(hue: 0.15, saturation: 0.2, brightness: 0.5)
    let display = MTMathUILabelMode.display
    let text = MTMathUILabelMode.text
    let left = MTTextAlignment.left
    let right = MTTextAlignment.right
    let center = MTTextAlignment.center
    let bb = Color.clear
    
    struct DemoText : Identifiable {
        let s: String
        let c: Color
        let a: MTTextAlignment
        let i: MTEdgeInsets
        let m: MTMathUILabelMode
        let w: CGFloat
        let id = UUID()
        
        init(_ s: String, _ c: Color = .clear, _ a: MTTextAlignment = .left,
             _ i: MTEdgeInsets = MTEdgeInsets(),
             _ m: MTMathUILabelMode = .display, _ w: CGFloat = 30) {
            self.s = s
            self.c = c
            self.a = a
            self.i = i
            self.m = m
            self.w = w
        }
    }
    
    func fancy() -> [DemoText] {
        [
            DemoText("3+2-5 = 0", back),
            DemoText("12+-3 > +14", back, center),
            DemoText("(-3-5=-8, -6-7=-13)"),
            DemoText("5\\times(-2 \\div 1) = -10", back, right, r20),
            DemoText("-h - (5xy+2) = z"),
            DemoText("\\frac12x + \\frac{3\\div4}2y = 25", bb, left, z, text),
            DemoText("\\frac{x+\\frac{12}{5}}{y}+\\frac1z = \\frac{xz+y+\\frac{12}{5}z}{yz}", back),
            DemoText("\\frac{x+\\frac{12}{5}}{y}+\\frac1z = \\frac{xz+y+\\frac{12}{5}z}{yz} ", back, left, z, text),
            DemoText("\\frac{x^{2+3y}}{x^{2+4y}} = x^y \\times \\frac{z_1^{y+1}}{z_1^{y+1}}", bb, left, z, display, 40),
            DemoText("\\frac{x^{2+3y}}{x^{2+4y}} = x^y \\times \\frac{z_1^{y+1}}{z_1^{y+1}} "),
            DemoText("5+\\sqrt{2}+3"),
            DemoText("\\sqrt{\\frac{\\sqrt{\\frac{1}{2}} + 3}{\\sqrt5^x}}+\\sqrt{3x}+x^{\\sqrt2}"),
            DemoText("\\sqrt[3]{24} + 3\\sqrt{2}24"),
            DemoText("\\sqrt[x+\\frac{3}{4}]{\\frac{2}{4}+1}"),
            DemoText("\\sin^2(\\theta)=\\log_3^2(\\pi)"),
            DemoText("\\lim_{x\\to\\infty}\\frac{e^2}{1-x}=\\limsup_{\\sigma}5"),
            DemoText("\\sum_{n=1}^{\\infty}\\frac{1+n}{1-n}=\\bigcup_{A\\in\\Im}C\\cup B"),
            DemoText("\\sum_{n=1}^{\\infty}\\frac{1+n}{1-n}=\\bigcup_{A\\in\\Im}C\\cup B ", bb, left, z, text),
            DemoText("\\lim_{x\\to\\infty}\\frac{e^2}{1-x}=\\limsup_{\\sigma}6", bb, left, z, text),
            DemoText("\\int_{0}^{\\infty}e^x \\,dx=\\oint_0^{\\Delta}5\\Gamma"),
            DemoText("\\int\\int\\int^{\\infty}\\int_0\\int^{\\infty}_0\\int"),
            DemoText("U_3^2UY_3^2U_3Y^2f_1f^2ff"),
            DemoText("\\notacommand"),
            DemoText("\\sqrt{1}"),
            DemoText("\\sqrt[|]{1}"),
            DemoText("{n \\choose k}"),
            DemoText("{n \\choose k} ", bb, left, z, text),
            DemoText("\\left({n \\atop k}\\right)"),
            DemoText("\\left({n \\atop m}\\right) ", bb, left, z, text),
            DemoText("\\underline{xyz}+\\overline{abc}", bb, left, z, text),
            DemoText("\\underline{\\frac12}+\\overline{\\frac34}", bb, left, z, text),
            DemoText("\\underline{x^\\overline{y}_\\overline{z}+5}", bb, left, z, text),
            DemoText("\\int\\!\\!\\!\\int_D dx\\,dy", bb, left, z, text),
            DemoText("\\int\\int_D dxdy", bb, left, z, text),
            DemoText("y\\,dx-x\\,dy", bb, left, z, text),
            DemoText("y dx - x dy",  bb, left, z, text),
            DemoText("hello\\ from \\quad the \\qquad other\\ side"),
            DemoText("\\vec x \\; \\hat y \\; \\breve {x^2} \\; \\tilde x \\tilde x^2 x^2 "),
            DemoText("\\hat{xyz} \\; \\widehat{xyz}\\; \\vec{2ab}"),
            DemoText("\\colorbox{#f0f0e0}{\\sqrt{1+\\colorbox{#d0c0d0}{\\sqrt{1+\\colorbox{#a080c0}{\\sqrt{1+\\colorbox{#7050a0}{\\sqrt{1+\\colorbox{403060}{\\colorbox{#102000}{\\sqrt{1+\\cdots}}}}}}}}}}}"),
            DemoText("\\begin{bmatrix} a & b\\\\ c & d \\\\ e & f \\\\ g &  h \\\\ i & j\\end{bmatrix}"),
            DemoText("x {\\scriptstyle y} z"),  // problem here
            DemoText("x \\mathrm x \\mathbf x \\mathcal X \\mathfrak x \\mathsf x \\bm x \\mathtt x \\mathit \\Lambda \\cal g"),
            DemoText("\\mathrm{using\\ mathrm}" ),
            DemoText("\\text{using text}", bb, left, z, text),
            DemoText("\\text{Mary has }\\$500 + \\$200."),
            DemoText("\\colorbox{#888888}{\\begin{pmatrix} \\colorbox{#ff0000}{a} & \\colorbox{#00ff00}{b} \\\\ \\colorbox{#00aaff}{c} & \\colorbox{#f0f0f0}{d} \\end{pmatrix}}", bb, left, z, text),
            DemoText("\\underline{xyz}+\\overline{abc}", bb, left, z, text),
            DemoText("\\underline{\\frac12}+\\overline{\\frac34}", bb, left, z, text),
            DemoText("\\underline{x^\\overline{y}_\\overline{z}+5}", bb, left, z, text),
            DemoText("\\int\\!\\!\\!\\int_D dx\\,dy", bb, left, z, text),
            DemoText("\\int\\int_D dxdy", bb, left, z, text),
            DemoText("y\\,dx-x\\,dy", bb, left, z, text),
            DemoText("y dx - x dy", bb, left, z, text),
        ]
    }
    
    let chars =
	"""
    \\text{ABCDEFGHIJKLMOPQRSTUVWXYZ} \\\\
    \\text{abcdefghijklmnopqrstuvwxyz 0123456789} \\\\
    \\text{<>?.,+-[]\\{\\}|=\\_()*\\%\\$!@\\#}
    """

    var body: some View {
        ScrollView([.vertical,.horizontal]) {
            VStack {
                if previewFonts {
                    // Display fonts
                    ForEach(MathFont.allCases) { id in
                        VStack(alignment: .leading) {
                            Text("Font: **\(id.rawValue)**").font(.title3)
                            MathView(equation: chars, font:id,
                                     textAlignment: .left, fontSize: 15)
                            .padding(.bottom, 10)
                        }
                    }
                }
                
                // Change this to view a different font
                // Note:
                // Asana has problems with large braces
                // Euler has problems with large radicals and determants
                // kpMathLightFont has problems with large radicals and braces
                // kpMathSansFont has problems with large radicals and braces
                let font = MathFont.latinModernFont
                
                // Display example equations
                ForEach(demoLabels, id: \.self) { label in
                    MathView(equation:label, font: font)
                }
                ForEach(fancy()) { label in
                    MathView(equation: label.s, font: font, textAlignment: label.a, fontSize: label.w, labelMode: label.m, insets: label.i)
                        .background(label.c)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
