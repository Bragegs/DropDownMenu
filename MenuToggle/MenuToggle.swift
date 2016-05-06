//
//  ToggleMenu.swift
//
//  Created by Brage Staven on 06.05.2016.
//  Copyright © 2016 Stav1. All rights reserved.
//

import UIKit

class ToggleMenu: UIView {
    
    
    /**
     Used to not add the menu buttons multiple times.
     */
    private var hasAddedButtonsToView = false
    /**
     The original height of the toggle menu. Is used to animate back to this height when untoggeling
     */
    private var originalHeight:CGFloat!
    /**
     Do not want it to layout multiple times.
     */
    private var hasLayedOutView=false
    
    /**
     The main button that toggles the menu.
     */
    let toggleButton = UIButton()
    /**
     The menu buttons.
     */
    var menuButtons = [UIButton]()
    /**
     The size of the buttons. Used to calculate the height of the menu. Default is 2 pixels smaller in width and height than the toggle button.
     */
    var buttonSize:CGSize!
    /**
     The blureffectView of the menu background.
     */
    var blurEffectView:UIVisualEffectView!
    /**
     If the view is toggled or not.
     */
    var toggled = false
    
    
    init(frame: CGRect, toggleImage: UIImage, menuButtons: [UIButton]) {
        self.menuButtons = menuButtons
        toggleButton.setImage(toggleImage, forState: .Normal)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutMenu()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    
    /**
     Toggles or untoggles the menu. Use this to manually toggle/untoggle the view
     */
    func togglePressed(){
        if toggled{
            animateUnToggle()
            self.toggled = false
        }else{
            animateToggle()
            self.toggled = true
        }
    }
    
    /**
     Changing the background effect of the toggle menu after x seconds
     
     - Parameter blur(UIBlurEffectStyle): the UIBlurEffectStyle of your choise
     - Parameter afterDelay(Double): number of seconds before the change should occour.
     - Default: UIBlurEffectStyle.Dark
     */
    
    func setBlurViewEffectStyle(blur:UIBlurEffectStyle, afterDelay:Double){
        delay(afterDelay) {
            self.blurEffectView.removeFromSuperview()
            let blurEffect = UIBlurEffect(style: blur)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.layer.cornerRadius = self.bounds.width/2
            blurEffectView.clipsToBounds = true
            blurEffectView.backgroundColor = .clearColor()
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.blurEffectView = blurEffectView
            self.insertSubview(blurEffectView, atIndex: 0)
        }
    }
    
    
    /**
     Adds the toggle button and the effect view background. Default is UIBlurEffectStyle.Dark
     */
    private func layoutMenu(){
        if !hasLayedOutView{
            hasLayedOutView = true
            self.backgroundColor = UIColor.clearColor()
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.bounds
            blurEffectView.layer.cornerRadius = self.bounds.width/2
            blurEffectView.clipsToBounds = true
            blurEffectView.backgroundColor = .clearColor()
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.insertSubview(blurEffectView, atIndex: 0)
            self.blurEffectView = blurEffectView
            let padding:CGFloat = 4
            toggleButton.frame = CGRectMake(padding, padding, self.bounds.width-(padding*2), self.bounds.width-(padding*2))
            toggleButton.addTarget(self, action: #selector(togglePressed), forControlEvents: .TouchDown)
            self.addSubview(toggleButton)
            self.buttonSize = CGSizeMake(self.toggleButton.bounds.width-2, self.toggleButton.bounds.height-2)
        }
    }
    
    /**
     Untoggles the menu
     */
    private func animateUnToggle(){
        let padding:CGFloat = 4
        UIView.animateWithDuration(0.2) {
            self.toggleButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            self.toggleButton.frame = CGRectMake(padding, padding, self.originalHeight-(padding*2), self.originalHeight-(padding*2))
            self.frame = CGRectMake(self.frame.minX, self.frame.minY, self.frame.width, self.originalHeight)
            self.layoutIfNeeded()
        }
        for i in 0..<self.menuButtons.count{
            let currentButton = self.menuButtons[i]
            UIView.animateWithDuration(0.1) {
                currentButton.alpha = 0.0
                currentButton.center = self.toggleButton.center
            }
        }
    }
    /**
     Toggles the menu
     */
    private func animateToggle(){
        if !hasAddedButtonsToView{
            addButtonsToView()
        }
        let paddingBetweenitems:CGFloat = 18.0
        let toggleButtonPadding:CGFloat = 4
        
        let menuHeight = (CGFloat((self.menuButtons.count+1))*(buttonSize.height+paddingBetweenitems))
        
        UIView.animateWithDuration(0.2) {
            self.toggleButton.transform =  CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            self.toggleButton.frame = CGRectMake(toggleButtonPadding, toggleButtonPadding, self.originalHeight-(toggleButtonPadding*2), self.originalHeight-(toggleButtonPadding*2))
            self.frame = CGRectMake(self.frame.minX, self.frame.minY, self.frame.width, menuHeight)
            self.layoutIfNeeded()
        }
        
        for i in (0..<self.menuButtons.count).reverse() {
            let currentButton = self.menuButtons[i]
            let yPosition = CGFloat(Double(i)+1.1) * (self.bounds.height-(self.toggleButton.frame.maxY-(paddingBetweenitems/CGFloat(menuButtons.count))))/CGFloat(self.menuButtons.count)
            UIView.animateWithDuration(0.5) {
                currentButton.center = CGPointMake(self.toggleButton.frame.midX,yPosition) //
                currentButton.alpha = 1.0
            }
        }
    }
    
    
    /**
     Adds the menu buttons to the view. It transforms the togglebutton so the transform animation of the button is similar on each toggle. Also sets the original height of the menu.
     */
    private func addButtonsToView(){
        self.hasAddedButtonsToView = true
        self.toggleButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        self.originalHeight = self.bounds.height
        for i in 0..<self.menuButtons.count{
            let currentButton = self.menuButtons[i]
            currentButton.frame = CGRectMake(0, 0, self.buttonSize.width, self.buttonSize.height)
            currentButton.center = CGPointMake(self.toggleButton.frame.midX, 0)
            currentButton.alpha = 0.0
            self.addSubview(currentButton)
        }
    }
    
    private func delay(delay: Double, closure: ()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            closure
        )
    }
}
