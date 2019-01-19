//
//  CoinCard.swift
//
//  Created by MYMAC on 4/10/18.
//  Copyright © 2018 MYMAC. All rights reserved.
//

import UIKit

class CoinCard: Card {

    private var coinImage = UIImageView()
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
        backgroundIV.addSubview(coinImage)
        backgroundIV.addSubview(detailLabel)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        coinImage.contentMode = .scaleAspectFit
        coinImage.image = UIImage(named: "Coins_shop")
        coinImage.clipsToBounds = true
        
        detailLabel.textColor = hexStringToUIColor(hex: "#23233C")
        detailLabel.font = UIFont(name: "Lato-Medium", size: 16)
        detailLabel.text = "Use coins to buy items. You get cool stuff, and you supports us <3"
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        detailLabel.alpha = 0.0
        
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
        
        let gridImageWidth: CGFloat = LayoutHelper.Width(34, of: backgroundIV)
        let gridImageHeight: CGFloat = LayoutHelper.Height(59, of: backgroundIV)
        let gridImageY: CGFloat = height - (gridImageHeight + detailLabelHeight)
        coinImage.frame = CGRect(x: (backgroundIV.frame.size.width - gridImageWidth) / 2,
                                     y: gridImageY,
                                     width: gridImageWidth,
                                     height: gridImageHeight)
        
        if (isPresenting) {
            detailLabel.alpha = 1.0
        }
        else {
            detailLabel.alpha = 0.0
        }
        
        print("height: \(isPresenting)")
    }

}
