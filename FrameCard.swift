//
//  FrameCard.swift
//
//  Created by MYMAC on 4/10/18.
//  Copyright © 2018 MYMAC. All rights reserved.
//

import UIKit

class FrameCard: Card {

    private var frameTitleImage = UIImageView()
    private var detailLabel = UILabel()
    private var framesImage = UIImageView()
    private var framesssImage = UIImageView()
    
    
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
        backgroundIV.addSubview(frameTitleImage)
        backgroundIV.addSubview(framesImage)
        backgroundIV.addSubview(framesssImage)
        backgroundIV.addSubview(detailLabel)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        frameTitleImage.contentMode = .scaleAspectFit
        frameTitleImage.image = UIImage(named: "frame_title")
        frameTitleImage.clipsToBounds = true
        
        framesImage.contentMode = .scaleAspectFit
        framesImage.image = UIImage(named: "img_frames")
        framesImage.clipsToBounds = true
        framesImage.alpha = 0.0
        
        framesssImage.contentMode = .scaleAspectFit
        framesssImage.image = UIImage(named: "Framesss")
        framesssImage.clipsToBounds = true
        framesssImage.alpha = 0.0
        
        detailLabel.textColor = hexStringToUIColor(hex: "#DFDFE5")
        detailLabel.font = UIFont(name: "Lato-Medium", size: 16)
        detailLabel.text = "Want Frames? We got you. Express yourself with lovely frames."
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
        
        
        let framesImageWidth: CGFloat = LayoutHelper.Width(92, of: backgroundIV)
        let framesImageHeight: CGFloat = LayoutHelper.Height(45, of: backgroundIV)
        let framesImageImageY: CGFloat = height - (framesImageHeight + detailLabelHeight + 40)
        framesImage.frame = CGRect(x: (backgroundIV.frame.size.width - framesImageWidth) / 2,
                                       y: framesImageImageY,
                                       width: framesImageWidth,
                                       height: framesImageHeight)
        
        
        let frameTitleImageWidth: CGFloat = LayoutHelper.Width(40, of: backgroundIV)
        let frameTitleImageHeight: CGFloat = LayoutHelper.Height(7, of: backgroundIV)
        let frameTitleImageY: CGFloat = height - (framesImageHeight + detailLabelHeight + frameTitleImageHeight + 80)
        frameTitleImage.frame = CGRect(x: (backgroundIV.frame.size.width - frameTitleImageWidth) / 2,
                                       y: frameTitleImageY,
                                       width: frameTitleImageWidth,
                                       height: frameTitleImageHeight)
        
        
        let framesssImageWidth: CGFloat = LayoutHelper.Width(83, of: backgroundIV)
        let framesssImageHeight: CGFloat = LayoutHelper.Height(55, of: backgroundIV)
        let framesssImageImageY: CGFloat = height - (framesImageHeight + detailLabelHeight + 40)
        framesssImage.frame = CGRect(x: (backgroundIV.frame.size.width - framesssImageWidth) / 2,
                                   y: framesssImageImageY,
                                   width: framesssImageWidth,
                                   height: framesssImageHeight)
        
        if (isPresenting) {
            framesssImage.alpha = 1.0
            framesImage.alpha = 0.0
        }
        else {
            framesssImage.alpha = 0.0
            framesImage.alpha = 1.0
        }
        
        
        print("height: \(isPresenting)")
    }

}
