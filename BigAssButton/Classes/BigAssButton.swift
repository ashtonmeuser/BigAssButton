//
//  BigAssButton.swift
//  AppleMusicAffiliate
//
//  Created by Ashton Meuser on 2017-11-02.
//  Copyright © 2017 Ashton Meuser. All rights reserved.
//

import UIKit

@IBDesignable class BigAssButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 50.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var verticalSpacing: CGFloat = 6.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    override func layoutSubviews() {
        alignVertical()
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius // Should be called after laying out subviews
        clipsToBounds = true
    }
    
    func alignVertical() {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font else {
                return
        }
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + verticalSpacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}

