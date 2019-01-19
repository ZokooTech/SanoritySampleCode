//
//  PointExchange.swift
//
//  Created by MYMAC on 4/9/18.
//  Copyright © 2018 MYMAC. All rights reserved.
//

import UIKit

@IBDesignable open class PointExchange: Card {

    private var coinImage = UIImageView()
    private var exchangeImage = UIImageView()
    private var labelCoin = UILabel()
    private var redeemButton = UIButton()
    private var labelTitle = UILabel()
    private var totalCoinRedeem: Float = 0.0
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
        backgroundIV.addSubview(labelTitle)
        backgroundIV.addSubview(coinImage)
        backgroundIV.addSubview(exchangeImage)
        backgroundIV.addSubview(labelCoin)
        backgroundIV.addSubview(redeemButton)
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        super.draw(rect)

        labelTitle.textColor = UIColor.white
        labelTitle.textAlignment = .center
        labelTitle.numberOfLines = 0
        labelTitle.alpha = 0.0
        
        coinImage.contentMode = .scaleAspectFit
        coinImage.image = UIImage(named: "Coin")
        coinImage.clipsToBounds = true
        coinImage.alpha = 0.0
        
        exchangeImage.contentMode = .scaleAspectFit
        exchangeImage.image = UIImage(named: "point_exchange")
        exchangeImage.clipsToBounds = true
        
        labelCoin.textColor = UIColor.white
        labelCoin.textAlignment = .center
  
        self.setData()
        redeemButton.layer.masksToBounds = true
        redeemButton.addTarget(self, action: #selector(self.redeemTapped(_:)), for: UIControlEvents.touchUpInside)
        
        
        layout(isPresenting: false)
    }

    func setData(exchangeRate: Float = 0, convertiblePoints: Int = 0, earnedCoin:Int = 0) {
        var redeemCoin: Float = 0.0
        if (exchangeRate != 0) {
            redeemCoin = Float(convertiblePoints) / exchangeRate
        }
        
        let boldFontAttribute = [NSAttributedStringKey.font:UIFont(name: "Lato-Black", size: 18)!,NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let lightFontAttribute = [NSAttributedStringKey.font:UIFont(name: "Lato-Light", size: 18)!,NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let exchangeRateString = NSMutableAttributedString(string: "1", attributes: boldFontAttribute)
        let coinStr = NSAttributedString(string: " Coin = ", attributes: lightFontAttribute)
        let rateStr = NSAttributedString(string: "\(exchangeRate)", attributes: boldFontAttribute)
        let pointStr = NSAttributedString(string: " Points", attributes: lightFontAttribute)
        
        exchangeRateString.append(coinStr)
        exchangeRateString.append(rateStr)
        exchangeRateString.append(pointStr)
        
        labelCoin.attributedText = exchangeRateString

        if (redeemCoin.isNaN) {
            redeemCoin = 0.0
        }
        
        var coins = redeemCoin.rounded(FloatingPointRoundingRule.up)
        if (coins.isNaN) {
            coins = 0.0
        }
        totalCoinRedeem = coins
        
        let regularFontAttribute14 = [NSAttributedStringKey.font:UIFont(name: "Lato-Regular", size: 14)!,NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let boldFontAttribute14 = [NSAttributedStringKey.font:UIFont(name: "Lato-Bold", size: 14)!,NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let earnedPointString = NSMutableAttributedString(string: "🤴\nYou’ve earned", attributes: regularFontAttribute14)
        let pointsStr = NSAttributedString(string: " \(earnedCoin) Points", attributes: boldFontAttribute14)
        earnedPointString.append(pointsStr)
        labelTitle.attributedText = earnedPointString

        setButtonTitleWith(color: hexStringToUIColor(hex: "F4DA63"))
        
    }
    
    func setButtonTitleWith(color: UIColor) {
        let boldFontAttributeRedeem = [NSAttributedStringKey.font:UIFont(name: "Lato-Bold", size: 18)!,NSAttributedStringKey.foregroundColor : color]
        
        let lightFontAttributeRedeem = [NSAttributedStringKey.font:UIFont(name: "Lato-Light", size: 18)!,NSAttributedStringKey.foregroundColor : color]
        
        let redeemString = NSMutableAttributedString(string: "REDEEM", attributes: lightFontAttributeRedeem)
        let coinStr1 = NSAttributedString(string: " \(Int(totalCoinRedeem)) COINS", attributes: boldFontAttributeRedeem)
        redeemString.append(coinStr1)
        
        redeemButton.setAttributedTitle(redeemString, for: UIControlState.normal)
    }
    
    @objc func redeemTapped(_ sender: UIButton) {
        self.delegate?.redeemCoinDidTapButton?(card: self, detailVC: self.detailVC)
    }
    
    override func layout(animating: Bool = true, isPresenting: Bool) {
        super.layout(animating: animating, isPresenting: isPresenting)
        
        let gimme = LayoutHelper(rect: backgroundIV.frame)
        
        coinImage.frame = CGRect(x: (backgroundIV.frame.size.width - 34) / 2,
                              y: gimme.Y(21),
                              width: 34,
                              height: 34)
        
        let exchangeImageWidth: CGFloat = LayoutHelper.Width(84, of: backgroundIV)
        let redeemButtonWidth: CGFloat = LayoutHelper.Width(78, of: backgroundIV)
        
        exchangeImage.frame = CGRect(x: (backgroundIV.frame.size.width - exchangeImageWidth) / 2,
                                 y: gimme.Y(34),
                                 width: exchangeImageWidth,
                                 height: 36)
        
        labelCoin.frame = CGRect(x: 0,
                                     y: gimme.Y(47),
                                     width: backgroundIV.frame.size.width,
                                     height: 22)
        
        redeemButton.frame = CGRect(x: (backgroundIV.frame.size.width - redeemButtonWidth) / 2,
                                 y: gimme.Y(68),
                                 width: redeemButtonWidth,
                                 height: 50)

        redeemButton.layer.cornerRadius = 25
        
        labelTitle.frame = CGRect(x: 0,
                                    y: gimme.Y(21),
                                    width: backgroundIV.frame.size.width,
                                    height: 45)
        
        
        
        
        if (isPresenting == true) {
            labelTitle.alpha = 1.0
            coinImage.alpha = 0.0
            redeemButton.backgroundColor = hexStringToUIColor(hex: "#F4DA63")
            redeemButton.setImage(UIImage(named: "Coin"), for: UIControlState.normal)
            let spacing: CGFloat = 10; // the amount of spacing to appear between image and title
            redeemButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
            redeemButton.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
            setButtonTitleWith(color: UIColor.black)
            //F4DA63
        }
        else {
            labelTitle.alpha = 0.0
            coinImage.alpha = 1.0
            
            redeemButton.backgroundColor = UIColor.white.withAlphaComponent(0.1)
            redeemButton.setImage(nil, for: UIControlState.normal)
            let spacing: CGFloat = 0; // the amount of spacing to appear between image and title
            redeemButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
            redeemButton.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
            setButtonTitleWith(color: hexStringToUIColor(hex: "F4DA63"))
        }
        print("height: \(isPresenting)")
    }
    


}
