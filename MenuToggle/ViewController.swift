//
//  ViewController.swift
//  MenuToggle
//
//  Created by Brage Staven on 06.05.2016.
//  Copyright © 2016 Stav1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addLightToggleView()
        addDarkToggleView()
        addExtraLightToggleView()
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
    
    func addLightToggleView(){
        var buttons = [UIButton]()
        for _ in 0..<6{
            let button = UIButton()
            button.setImage(UIImage(named: "Toggle"), forState: .Normal)
            buttons.append(button)
            button.addTarget(self, action: #selector(lightMenuButtonPressed), forControlEvents: .TouchUpInside)
        }
        
        let toggleView = ToggleMenu(frame: CGRectMake((self.view.bounds.width*0.66)-92,40, 46, 46), toggleImage: UIImage(named: "Toggle")!, menuButtons: buttons)
        self.view.addSubview(toggleView)
        toggleView.setBlurViewEffectStyle(UIBlurEffectStyle.Light,afterDelay: 0.0)
    }
    
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
        toggleView3.setBlurViewEffectStyle(UIBlurEffectStyle.ExtraLight,afterDelay: 0.0)
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

