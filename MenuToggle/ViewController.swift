//
//  ViewController.swift
//  MenuToggle
//
//  Created by Brage Staven on 06.05.2016.
//  Copyright © 2016 Stav1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Connect the menu from the storyboard. The view must have constraints for height and width where height-constraint = width-constraint.
    @IBOutlet weak var theToggleMenu: ToggleMenu!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Adding menubuttons to XIB toggleMenu
       var buttons = [UIButton]()
        for _ in 0..<3{
            let button = UIButton()
            button.setImage(UIImage(named: "Toggle"), forState: .Normal)
            buttons.append(button)
            button.addTarget(self, action: #selector(darkMenuButtonPressed), forControlEvents: .TouchUpInside)
        }
        self.theToggleMenu.menuButtons = buttons
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addLightToggleView()
        addDarkToggleView()
        addExtraLightToggleView()
    }
    
    //You can add the toggleMenu programatically
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    func addDarkToggleView(){
        var buttons = [UIButton]()
        for _ in 0..<10{
            let button = UIButton()
            button.setImage(UIImage(named: "SaveMedia"), forState: .Normal)
            buttons.append(button)
            button.addTarget(self, action: #selector(darkMenuButtonPressed), forControlEvents: .TouchUpInside)
        }
        
        let toggleView = ToggleMenu(frame: CGRectMake((self.view.bounds.width*0.33)-92,40, 46, 46), toggleImage: UIImage(named: "Toggle")!, menuButtons: buttons)
        
        self.view.addSubview(toggleView)
    }
    
    // Custom effect style on init:
    func addLightToggleView(){
        var buttons = [UIButton]()
        for _ in 0..<6{
            let button = UIButton()
            button.setImage(UIImage(named: "Toggle"), forState: .Normal)
            buttons.append(button)
            button.addTarget(self, action: #selector(lightMenuButtonPressed), forControlEvents: .TouchUpInside)
        }
        
        let toggleView = ToggleMenu(frame: CGRectMake((self.view.bounds.width*0.66)-92,40, 46, 46), toggleImage: UIImage(named: "Toggle")!, menuButtons: buttons,withEffectStyle:UIBlurEffectStyle.Light)
        self.view.addSubview(toggleView)
    }
    
    // Custom effect style change with delay:
    func addExtraLightToggleView(){
        var buttons = [UIButton]()
        for _ in 0..<3{
            let button = UIButton()
            button.setImage(UIImage(named: "Menu-100"), forState: .Normal)
            buttons.append(button)
            button.addTarget(self, action: #selector(extraLightMenuButtonPressed), forControlEvents: .TouchUpInside)
        }
        
        let toggleView3 = ToggleMenu(frame: CGRectMake((self.view.bounds.width*0.99)-92,40, 46, 46), toggleImage: UIImage(named: "Menu-100")!, menuButtons: buttons)
        self.view.addSubview(toggleView3)
        toggleView3.setBlurViewEffectStyle(UIBlurEffectStyle.ExtraLight,afterDelay: 0.5)
    }
    
    func darkMenuButtonPressed(){
        print("I pressed a dark menu button")
    }
    func lightMenuButtonPressed(){
        print("I pressed a light menu button")
    }
    func extraLightMenuButtonPressed(){
        print("I pressed a extra-light menu button")
    }
    
    @IBAction func icons8pressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.icons8.com")!)
    }

}

