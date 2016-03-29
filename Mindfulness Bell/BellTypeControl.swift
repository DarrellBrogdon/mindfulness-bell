//
//  BellTypeControl.swift
//  Mindfulness Bell
//
//  Created by Darrell Brogdon on 12/31/15.
//  Copyright © 2015 Darrell Brogdon. All rights reserved.
//

import UIKit

class BellTypeControl: UIView {
    // MARK: Properties
    
    var theType = 0
    
    let smallButton = UIButton()
    let largeButton = UIButton()
    
    // MARK: Intialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        smallButton.tag = 0
        largeButton.tag = 1
        
        smallButton.setImage(UIImage(named: "SmallBell"), forState: .Normal)
        smallButton.setImage(UIImage(named: "SmallBellDisabled"), forState: .Disabled)
        largeButton.setImage(UIImage(named: "LargeBell"), forState: .Normal)
        largeButton.setImage(UIImage(named: "LargeBellDisabled"), forState: .Disabled)
        
        smallButton.layer.cornerRadius = 4
        smallButton.layer.borderWidth = 0
        smallButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        largeButton.layer.cornerRadius = 4
        largeButton.layer.borderWidth = 0
        largeButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        smallButton.addTarget(self, action: #selector(BellTypeControl.buttonTapped(_:)), forControlEvents: .TouchDown)
        largeButton.addTarget(self, action: #selector(BellTypeControl.buttonTapped(_:)), forControlEvents: .TouchDown)
        
        addSubview(smallButton)
        addSubview(largeButton)
    }
    
    override func layoutSubviews() {
        smallButton.frame = CGRect(x: 0, y: 16, width: 96, height: 96)
        largeButton.frame = CGRect(x: 127, y: 0, width: 128, height: 128)
    }
    
    // MARK: Button Action
    
    func buttonTapped(button: UIButton) {
        theType = button.tag
        
        smallButton.layer.borderWidth = 0
        largeButton.layer.borderWidth = 0
        
        button.layer.borderWidth = 1
        
        print("Tapped the \(theType) button")
    }
    
    func toggleEnabled() {
        smallButton.enabled = !smallButton.enabled
        largeButton.enabled = !largeButton.enabled
    }
}
