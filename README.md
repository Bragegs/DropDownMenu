DropDownMenu
=========

This library provides a very light drop down menu in swift. The icons used in the example project is downloaded from [icons8](www.icons8.com).

How To Use
----------

You only need the 'MenuToggle.swift', copy that to your project.
```Swift
import UIKit

func addToggleMenu(){

    var buttons = [UIButton]()
    for _ in 0..<10{
        let button = UIButton()
        button.setImage(UIImage(named: "menuButton"), forState: .Normal)
        buttons.append(button)
        button.addTarget(self, action: #selector(darkMenuButtonPressed), forControlEvents: .TouchUpInside)
    }

    let toggleView = ToggleMenu(frame: CGRectMake((40,40, 46, 46), toggleImage: UIImage(named: "Toggle")!, menuButtons: buttons)

    self.view.addSubview(toggleView)
}

func darkMenuButtonPressed(){
    print("I pressed a dark menu button")
}

```

(Download the project to see how to use the menu)

## License

The MIT License (MIT)
Copyright (c) 2016 Brage G. Staven

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
