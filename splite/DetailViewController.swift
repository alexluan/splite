//
//  DetailViewController.swift
//  splite
//
//  Created by 栾有数 on 15/10/18.
//  Copyright © 2015年 栾有数. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    
    

    var detailItem: ColorPalette? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        if let colors = self.detailItem?.children {
            if colors.count >= 5 {
                label1?.backgroundColor = UIColorFromHexString(colors[0].name)
                label2?.backgroundColor = UIColorFromHexString(colors[1].name)
                label3?.backgroundColor = UIColorFromHexString(colors[2].name)
                label4?.backgroundColor = UIColorFromHexString(colors[3].name)
                label5?.backgroundColor = UIColorFromHexString(colors[4].name)
                if let tt = label1{
                    tt.text = colors[0].name
                }
                label1?.text = colors[0].name
                label2?.text = colors[1].name
                label3?.text = colors[2].name
                label4?.text = colors[3].name
                label5?.text = colors[4].name
    //            if let label = self.detailDescriptionLabel {
    //                label.text = detail.description
    //            }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label1?.text = "asdfasdf"

        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func UIColorFromHexString(hex:String)->UIColor{
        var rgbValue:CUnsignedInt = 0
        let scanner:NSScanner = NSScanner(string: hex)
        scanner.scanLocation = 1;
        scanner.scanHexInt(&rgbValue)
        return UIColorFromUInt32(rgbValue)
        
    }
    func UIColorFromUInt32(rgbHex:CUnsignedInt)->UIColor{
//        let floata:CGFloat = CGFloat(rgbHex & 0xff0000)
//        let float:CGFloat = CGFloat((rgbHex & 0xff0000)>>16)
        let red:CGFloat = CGFloat((rgbHex & 0xff0000)>>16)/255.0
        let green:CGFloat = CGFloat((rgbHex & 0x00ff00)>>16)/255.0
        let blue:CGFloat = CGFloat((rgbHex & 0x0000ff)>>16)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

}

