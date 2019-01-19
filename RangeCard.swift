//
//  RangeCard.swift
//
//  Created by MYMAC on 4/10/18.
//  Copyright © 2018 MYMAC. All rights reserved.
//

import UIKit

class RangeCard: Card {
    
    private var magnetRangeImage = UIImageView()
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
        backgroundIV.addSubview(magnetRangeImage)
        backgroundIV.addSubview(detailLabel)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        super.draw(rect)

        magnetRangeImage.contentMode = .scaleAspectFit
        magnetRangeImage.image = UIImage(named: "magnet_range")
        magnetRangeImage.clipsToBounds = true

        detailLabel.textColor = hexStringToUIColor(hex: "#8D8DB8")
        detailLabel.font = UIFont(name: "Lato-Medium", size: 16)
        detailLabel.text = "Not a fan of walking? We got you covered. Pull content to you."
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

        let gridImageWidth: CGFloat = backgroundIV.frame.size.width
        let gridImageHeight: CGFloat = LayoutHelper.Height(54, of: backgroundIV)
        let gridImageY: CGFloat = height - (gridImageHeight + detailLabelHeight + 10)
        magnetRangeImage.frame = CGRect(x: 0,
                                 y: gridImageY,
                                 width: gridImageWidth,
                                 height: gridImageHeight)
        
        
        print("height: \(isPresenting)")
    }
}
