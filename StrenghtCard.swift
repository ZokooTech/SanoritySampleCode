//
//  StrenghtCard.swift
//
//  Created by MYMAC on 4/10/18.
//  Copyright © 2018 MYMAC. All rights reserved.
//

import UIKit

class StrenghtCard: Card {

    private var strenghtImage = UIImageView()
    private var detailLabel = UILabel()
    
    // View Life Cycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override  func initialize() {
        super.initialize()
        backgroundIV.addSubview(strenghtImage)
        backgroundIV.addSubview(detailLabel)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        strenghtImage.contentMode = .scaleAspectFit
        strenghtImage.image = UIImage(named: "magnet_strength")
        strenghtImage.clipsToBounds = true
        
        detailLabel.textColor = hexStringToUIColor(hex: "#DBAA9C")
        detailLabel.font = UIFont(name: "Lato-Medium", size: 16)
        detailLabel.text = "Sucking 10 posts towards you is cool. 50 posts is suck-tastic."
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        
        layout(isPresenting: false)
    }
    
    override func layout(animating: Bool = true, isPresenting: Bool) {
        super.layout(animating: animating, isPresenting: isPresenting)
        
        let gimme = LayoutHelper(rect: backgroundIV.frame)
        
        let height = backgroundIV.frame.size.height
        
        let detailLabelHeight: CGFloat = 56
        detailLabel.frame = CGRect(x: (backgroundIV.frame.size.width - LayoutHelper.Width(80, of: backgroundIV)) / 2,
                                   y: gimme.YBottom(5, height: detailLabelHeight, from: backgroundIV),
                                   width: LayoutHelper.Width(80, of: backgroundIV),
                                   height: detailLabelHeight)
        
        let gridImageWidth: CGFloat = LayoutHelper.Width(45, of: backgroundIV)
        let gridImageHeight: CGFloat = LayoutHelper.Height(44, of: backgroundIV)
        let gridImageY: CGFloat = height - (gridImageHeight + detailLabelHeight + 10)
        strenghtImage.frame = CGRect(x: (backgroundIV.frame.size.width - gridImageWidth) / 2,
                                        y: gridImageY,
                                        width: gridImageWidth,
                                        height: gridImageHeight)
        
        
        print("height: \(isPresenting)")
    }

}
