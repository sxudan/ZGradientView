//
//  ViewController.swift
//  ZGradientView
//
//  Created by sxudan on 12/28/2020.
//  Copyright (c) 2020 sxudan. All rights reserved.
//

import UIKit
import ZGradientView

class ViewController: UIViewController {

    @IBOutlet weak var gradientView4: ZGradientView!
    @IBOutlet weak var gradientView3: ZGradientView!
    @IBOutlet weak var gradientView2: ZGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientView2.colors = [UIColor(hex: "#800080ff")!.cgColor, UIColor(hex: "#ffc0cbff")!.cgColor]
        gradientView3.colors = [UIColor(hex: "#00F260ff")!.cgColor, UIColor(hex: "#0575E6ff")!.cgColor]
        gradientView4.colors = [UIColor(hex: "#8A2387ff")!.cgColor, UIColor(hex: "#E94057ff")!.cgColor, UIColor(hex: "#F27121ff")!.cgColor]
        
        gradientView4.locations = [0.15, 0.7, 1.0]
        gradientView2.diagonalMode = true
        gradientView4.horizontalMode = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
