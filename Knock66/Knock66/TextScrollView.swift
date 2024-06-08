//
//  TextScrollView.swift
//  Knock66
//
//  Created by 白数叡司 on 2024/06/08.
//

import SwiftUI

struct TextScrollView: UIViewRepresentable {
    typealias UIViewType = UITextScrollView
    
    let text: String
    @Binding var percent: Double
    
    func makeUIView(context: Context) -> UITextScrollView {
        let textScrollView = UITextScrollView()
        textScrollView.setText(text: text)
        return textScrollView
    }
    
    func updateUIView(_ uiView: UITextScrollView, context: Context) {
        uiView.setContentOffset(percent: percent)
    }
}

public class UITextScrollView: UIView {
    private lazy var scrollView = UIScrollView()
    private lazy var textView = UITextView()
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.backgroundColor = .white
        scrollView.isUserInteractionEnabled = false
        addSubview(scrollView)
        
        textView.textColor = UIColor.black
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isEditable = false
        
        scrollView.addSubview(textView)
    }
    
    public override func layoutSubviews() {
        scrollView.frame = frame
        let textViewSize = textView.sizeThatFits(CGSize(width: frame.size.width, height: 0))
        textView.frame.size = textViewSize
        scrollView.contentSize = textViewSize
    }
    
    func setText(text: String) {
        textView.text = text
    }
    
    func setContentOffset(percent: Double) {
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.bounds.height
        if contentHeight < frameHeight {
            return
        }
        
        let diff = contentHeight - frameHeight
        let offset = diff * percent / 100
        scrollView.setContentOffset(CGPoint(x: 0.0, y: offset), animated: true)
    }
}
