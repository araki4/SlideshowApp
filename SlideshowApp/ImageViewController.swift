//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by ryouta.araki4 on 2022/01/21.
//

import UIKit

class ImageViewController: UIViewController {
    
    // 拡大画像の表示用IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    // 画像リストのインデックス
    var imageIndex: Int = 0

    // スライド対象の画像リスト
    var imageList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 画像の読み込み
        imageView.image = UIImage.init(named: self.imageList[self.imageIndex])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
