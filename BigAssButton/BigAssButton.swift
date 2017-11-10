//
//  BigAssButton.swift
//  AppleMusicAffiliate
//
//  Created by Ashton Meuser on 2017-11-02.
//  Copyright © 2017 Ashton Meuser. All rights reserved.
//

import UIKit

@IBDesignable class BigAssButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var verticalSpacing: CGFloat = 6.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var imageSize: CGFloat = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var foregroundColor: UIColor = .white {
        didSet {
            setColors()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        isExclusiveTouch = true
        imageView?.contentMode = .scaleAspectFit
        adjustsImageWhenHighlighted = false
        adjustsImageWhenDisabled = false
        setColors()
        alpha = isEnabled == true ? 1.0 : 0.5
    }
    
    func setColors() {
        setTitleColor(foregroundColor, for: .normal)
        setTitleColor(foregroundColor.withAlphaComponent(0.5), for: .highlighted)
        setTitleColor(foregroundColor.withAlphaComponent(0.5), for: .selected)
        imageView?.tintColor = foregroundColor
    }
    
    override var isHighlighted: Bool {
        didSet {
            imageView?.tintColor = foregroundColor.withAlphaComponent(isHighlighted == true ? 0.5 : 1.0)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView?.tintColor = foregroundColor.withAlphaComponent(isSelected == true ? 0.5 : 1.0)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled == true ? 1.0 : 0.5
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = cornerRadius // Should be called after laying out subviews
        clipsToBounds = true
        
        guard let imageView = imageView,
            let image = imageView.image else { // Text only, use default behavior
            return
        }
        
        let aspectRatio = image.size.width/image.size.height
        var size: CGFloat = 0.0
        switch imageSize {
        case 0.0:
            size = image.size.height
        case 0.0...1.0:
            size = frame.width*imageSize
        default:
            size = imageSize
        }
        
        guard let text = self.titleLabel?.text,
            let font = self.titleLabel?.font else { // Image only, center image
            imageView.frame = CGRect(x: (frame.width-size)/2.0, y: (frame.height-size)/2.0, width: size*aspectRatio, height: size)
            return
        }
        
        // Arrange text and image
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
        let totalHeight = size + titleSize.height + verticalSpacing
        
        imageView.frame = CGRect(x: (frame.width-size)/2.0, y: (frame.height-totalHeight)/2.0, width: size*aspectRatio, height: size)
        titleLabel?.frame = CGRect(x: (frame.width-titleSize.width)/2.0, y: (frame.height+totalHeight)/2.0-titleSize.height, width: titleSize.width, height: titleSize.height)
    }
}

