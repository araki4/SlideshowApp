//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ryouta.araki4 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像表示用のIBOutlet
    @IBOutlet weak var imageArea: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 画像の読み込み
        imageArea.image = UIImage.init(named: "image1")
    }


}

