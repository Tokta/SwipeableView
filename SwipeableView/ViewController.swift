//
//  ViewController.swift
//  SwipeableView
//
//  Created by Alessio on 25/09/18.
//  Copyright © 2018 Mitric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Create a UIScrollView view
        let scroll = UIScrollView(frame: self.view.bounds)
        scroll.backgroundColor = .white
        scroll.isUserInteractionEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.isScrollEnabled = true
        self.view.addSubview(scroll)
        
        var yPosition: CGFloat = 0
        for num in 1...20{
            
            let cell = SwipeableView(frame: CGRect(x: 0, y: yPosition, width: scroll.frame.size.width, height: 50), backgroundColor: .white)
            
            let label = UILabel(frame: CGRect(x: 10, y: 0, width: scroll.frame.size.width - 20, height: 50))
            label.text = "- \(num)"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 15)
            label.lineBreakMode = .byTruncatingTail
            cell.addSubview(label)
            
            cell.addAction(title: "Dog",
                           image: UIImage(named: "dog") ?? UIImage(),
                           backgroundcolor: UIColor.red.withAlphaComponent(0.75)) {
                            print("num \(num)")
            }
            
            cell.addAction(title: "Fish",
                           image: UIImage(named: "fish") ?? UIImage(),
                           backgroundcolor: UIColor.blue.withAlphaComponent(0.75)) {
                            print("num \(num)")
            }
            
        
            cell.addAction(title: "Nothing",
                           image: nil,
                           backgroundcolor: UIColor.green.withAlphaComponent(0.75)) {
                            print("num \(num)")
            }
            scroll.addSubview(cell)
            yPosition += cell.frame.size.height
        }
        scroll.contentSize = CGSize(width: 10, height: yPosition)
    }
}
