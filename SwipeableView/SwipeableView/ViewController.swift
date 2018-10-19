//
//  ViewController.swift
//  SwipeableView
//
//  Created by Alessio on 25/09/18.
//  Copyright © 2018 Mitric. All rights reserved.
//
/*
 https://jsonplaceholder.typicode.com/photos
 */
import UIKit
class MyCell: UITableViewCell {
    
    var cellCustomObject:CustomObject?
    var swipeBG:SwipeableView!
    
    let cellHeight:CGFloat = 70.0
    
    
    func drawContentForSize(size:CGSize){
        
        let pad:CGFloat = 5
        self.backgroundColor = UIColor.white
        self.swipeBG = SwipeableView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.cellHeight), backgroundColor: UIColor.white)
        self.addSubview(swipeBG)
        
        let userIconH:CGFloat = 40
        let userIcon = UIImageView(image:self.cellCustomObject?.avatar == nil ? MUtilities.image( #imageLiteral(resourceName: "ButtonUser") , with: UIColor.defaultNavigationBar()) : self.cellCustomObject?.avatar)
        userIcon.frame = CGRect(x: pad, y: MUtilities.getMiddleYPoint(in: self, forViewWithSizeHeight: userIconH), width: userIconH, height: userIconH)
        userIcon.contentMode = .scaleAspectFill
        userIcon.layer.cornerRadius = userIconH/2
        userIcon.layer.masksToBounds = true
        self.swipeBG.addSubview(userIcon)
        
        let userLabelTitle = UILabel(frame: CGRect(x: MUtilities.getRightXpoint(for: userIcon, plusPad: Int32(pad)), y: pad, width: size.width - pad - userIcon.frame.size.width - pad , height: (cellHeight-2*pad)/2))
        userLabelTitle.text = self.cellCustomObject?.title
        userLabelTitle.font = UIFont.systemFont(ofSize: 18)
        userLabelTitle.textColor = UIColor.black
        swipeBG.addSubview(userLabelTitle)
        
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        let userLabelSubTitle = UILabel(frame: CGRect(x: MUtilities.getRightXpoint(for: userIcon, plusPad: Int32(pad)), y: MUtilities.getBottomYpoint(for: userLabelTitle), width: size.width - pad - userIcon.frame.size.width - pad , height: (cellHeight-2*pad)/2))
        userLabelSubTitle.text = df.string(from: self.cellCustomObject!.release!)
        userLabelSubTitle.font = UIFont.systemFont(ofSize: 14)
        userLabelSubTitle.textColor = UIColor.gray
        self.swipeBG.addSubview(userLabelSubTitle)
        
        MUtilities.addBottomBorder(on: self, withPad: 0, color: UIColor.lightGray)
        
    }
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var myTableView:UITableView!
    var dataSource = [CustomObject]()
    var tableViewWidth:CGFloat! = 0
    var backbone:CustomBackboneInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.backbone = CustomBackboneInterface(frame: self.view.bounds, title: "Movies")
        self.view.addSubview(self.backbone)
        
        self.myTableView = UITableView()
        self.myTableView.frame = (self.backbone.container?.bounds)!
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.myTableView.register(MyCell.self, forCellReuseIdentifier: "CellR")
        self.myTableView.separatorStyle = .none
        self.tableViewWidth = self.view.frame.width
        self.backbone.container.addSubview(self.myTableView)

    }
    
    //Tableview delegate & DataSource
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.myTableView{
            return 70
        }else{
            return 0
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSource.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellR", for: indexPath as IndexPath) as! MyCell
        cell.cellCustomObject = self.dataSource[indexPath.row]
        cell.subviews.forEach({ $0.removeFromSuperview() })
        
        cell.drawContentForSize(size: CGSize(width: tableViewWidth, height: 70))
        cell.swipeBG.addAction(title: "Get ticket", image: UIImage(), backgroundcolor: UIColor.defaultGreen(), tag:indexPath.row, target: self, action:{
            self.getTicket()
        })
        
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    @objc func getTicket(){
        print("Hello")
    }
    
}

