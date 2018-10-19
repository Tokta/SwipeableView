//
//  SwipeableView.swift
//  SwipeableView
//
//  Created by Alessio on 25/09/18.
//  Copyright © 2018 Mitric. All rights reserved.
//

import UIKit

@objc class SwipeableView: UIView {
    
    var startingFrame:CGRect!
    @objc var container:UIView!
    var startingX:CGFloat!
    var minMoveX:CGFloat!
    var maxMoveX:CGFloat!
    var actionWidth:CGFloat!
    var actions = [UIView]()
    
    @objc public init(frame: CGRect,backgroundColor: UIColor) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        
        
        self.container = UIView(frame: self.bounds)
        self.container.backgroundColor = backgroundColor
        self.addSubview(self.container)
        
        self.startingFrame = frame
        self.startingX =  self.center.x
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        self.addGestureRecognizer(pan)
        self.minMoveX = 0
        self.maxMoveX = frame.origin.x
        self.actionWidth = frame.size.height
    }
    
    @objc func addAction(title:String,image:UIImage?,backgroundcolor:UIColor,tag:Int,target:Any,action:@escaping ()->()){
        
        let pad = (self.actionWidth/2)/6
        
        let actionView = UIView.init(frame: CGRect(x: self.container.frame.size.width + CGFloat(actions.count)*actionWidth + 1, y: 0, width: actionWidth - 1, height: self.frame.size.height))
        actionView.backgroundColor = backgroundcolor
        self.addSubview(actionView)
        
        if image != nil {
            
            let imageView = UIImageView(frame: CGRect(x: pad, y: pad, width: self.actionWidth - 2*pad, height: (self.actionWidth)/2 - pad))
            imageView.image = image
            imageView.contentMode = .center
            actionView.addSubview(imageView)
            
            let label = UILabel(frame: CGRect(x: pad, y: imageView.frame.size.height + imageView.frame.origin.y, width: self.actionWidth - 2*pad, height: (self.actionWidth)/2 - pad))
            label.text = title
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 10)
            label.textAlignment = .center
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 2
            label.minimumScaleFactor = 0.1
            actionView.addSubview(label)
            
        }else{
            
            let label = UILabel(frame: CGRect(x: pad, y: pad, width: self.actionWidth - 2*pad, height: self.actionWidth - 2*pad))
            label.text = title
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 10)
            label.textAlignment = .center
            actionView.addSubview(label)
            
        }
        
        let button = UIButton(type: .custom)
        button.frame = actionView.bounds
        button.backgroundColor = UIColor.clear
        button.isUserInteractionEnabled = true
        button.tag = tag
        //button.addTarget(target, action: action, for: .touchUpInside)
        button.addAction {
            action()
        }
        actionView.addSubview(button)
        
        print("1 - \(self.frame) - \(self.center.x)")
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width + actionView.frame.size.width + 1, height: self.frame.size.height)
        self.startingX =  self.center.x
        self.actions.append(actionView)
        self.minMoveX = self.frame.origin.x - actionWidth*CGFloat(self.actions.count)
        print("2 - \(self.frame) - \(self.center.x)")
    }
    
    @objc func handlePan(pan:UIPanGestureRecognizer){
        print("COMPARE: - \(self.frame) - \(pan.view?.frame ?? CGRect.zero)")
        var center = pan.view?.center
        let translation = pan.translation(in: pan.view)
        
        center = CGPoint(x: (center?.x)! + translation.x, y: (center?.y)!)
        
        let startingXmin = self.minMoveX + self.startingX
        let startingXmax = self.maxMoveX + self.startingX
        print("\(self.startingX ?? 9) -> \(startingXmin) - \(center?.x ?? 99999) - \(startingXmax)")
        
        if pan.state == .changed {
            
            if startingXmin.isLess(than: (center?.x)!) && (center?.x.isLess(than: startingXmax))!{
                pan.view?.center = center!
                pan.setTranslation(CGPoint.zero, in: pan.view)
            }
        }
        
        if pan.state == .ended {
            let halfCenterX = (self.maxMoveX + self.minMoveX)/2
            if (pan.view?.frame.origin.x)! < halfCenterX{
                //OPEN
                center = CGPoint(x: (center?.x)! + self.minMoveX, y: (center?.y)!)
                UIView.animate(withDuration: 0.5) {
                    self.frame = CGRect(x: self.minMoveX, y: (pan.view?.frame.origin.y)!, width: (pan.view?.frame.size.width)!, height: (pan.view?.frame.size.height)!)
                    pan.setTranslation(CGPoint.zero, in: self.container)
                    print("OPEN: \(self.frame)")
                }
                
            }else{
                //CLOSE
                center = CGPoint(x: (center?.x)! + self.maxMoveX, y: (center?.y)!)
                UIView.animate(withDuration: 0.5) {
                    self.frame = CGRect(x: self.maxMoveX, y: (pan.view?.frame.origin.y)!, width: (pan.view?.frame.size.width)!, height: (pan.view?.frame.size.height)!)
                    pan.setTranslation(CGPoint.zero, in: self.container)
                    print("CLOSE: \(self.frame)")
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class ClosureSleeve {
    let closure: () -> ()
    
    init(attachTo: AnyObject, closure: @escaping () -> ()) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    @objc func invoke() {
        closure()
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControlEvents = .primaryActionTriggered, action: @escaping () -> ()) {
        let sleeve = ClosureSleeve(attachTo: self, closure: action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
    }
}
