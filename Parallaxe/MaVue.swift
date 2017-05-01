//
//  MaVue.swift
//  Parallaxe
//
//  Created by Alexandre Torres on 11/04/2017.
//  Copyright © 2017 Alexandre Torres. All rights reserved.
//

import UIKit

class MaVue: UIView {
    
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let img = UIImage(named: "alexou.jpg")
        let imgV = UIImageView(image: img)
        let echelle = frame.height / (img?.size.height)!
        imgV.frame = CGRect(x: 0.0, y: 0.0,
                            width: (img?.size.width)! * echelle + 50.0, height: (img?.size.height)! * echelle + 50.0)
        
        let effetH = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        effetH.minimumRelativeValue = -20.0
        effetH.maximumRelativeValue = 20.0
        
        let effetV = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        effetV.minimumRelativeValue = -20.0
        effetV.maximumRelativeValue = 20.0
        
        imgV.addMotionEffect(effetH)
        imgV.addMotionEffect(effetV)
        
        label.text = "Bonjour"
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        
        self.addSubview(imgV)
        self.addSubview(label)
        
        display(size: frame.size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(size : CGSize){
        label.sizeToFit()
        label.center = CGPoint(x: size.width/2, y: size.height/2)
    }

}
