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
            
            //Create a SwipeableView
            let cell = SwipeableView(frame: CGRect(x: 0, y: yPosition, width: scroll.frame.size.width, height: 50), backgroundColor: .white)
            
            //Customize your SwipeableView
            let label = UILabel(frame: CGRect(x: 10, y: 0, width: scroll.frame.size.width - 20, height: 50))
            label.text = "- \(num)"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 15)
            label.lineBreakMode = .byTruncatingTail
            cell.addSubview(label)
            
            //add actions to the SwipeableView
            cell.addAction(title: "Dog",
                           image: UIImage(named: "dog") ?? UIImage(),
                           backgroundcolor: UIColor.red.withAlphaComponent(0.75)) {
                            self.showAlert("Dog \(num)")
            }
            
            cell.addAction(title: "Fish",
                           image: UIImage(named: "fish") ?? UIImage(),
                           backgroundcolor: UIColor.blue.withAlphaComponent(0.75)) {
                            self.showAlert("Fish \(num)")
            }
            
        
            cell.addAction(title: "Nothing",
                           image: nil,
                           backgroundcolor: UIColor.green.withAlphaComponent(0.75)) {
                            self.showAlert("Nothing \(num)")
            }
            scroll.addSubview(cell)
            yPosition += cell.frame.size.height
            
            if num == 7 {
                
                //advanced customization of cell action
                let action = cell.actions[0]
                action.label.text = "Cat"
                action.label.textColor = .red
                action.backgroundColor = .yellow
                
                action.imageView?.backgroundColor = .white
                
            }
        }
        scroll.contentSize = CGSize(width: 10, height: yPosition)
        
        
    }
    
    func showAlert(_ title: String){
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
