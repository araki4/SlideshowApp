//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ryouta.araki4 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像表示用のIBOutlet
    @IBOutlet weak var imageView: UIImageView!
    // ダミー用のIBOutlet
    @IBOutlet weak var dummyImageView: UIImageView!
    
    // スライド用のIBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    // ダミー用のスライド用のIBOutlet
    @IBOutlet weak var dummyScrollView: UIScrollView!
    
    
    
    // 仮置きの進むボタン
    @IBAction func testButton(_ sender: Any) {
        slideImage(direction: "right")
        
    }
    
    // 仮置きの戻るボタン
    @IBAction func testButton2(_ sender: Any) {
        slideImage(direction: "left")
    }
    
    // 画像リストのインデックス
    var imageIndex: Int = 0

    // スライド対象の画像リスト
    let imageList: [String] = ["image1", "image2", "image3", "image4"]

    // スライド移動先のX座標の指定
    var translationX: CGFloat = 0
    
    // スライドメソッド
    // direction：スライド先の指定（”right”, "left"）
    func slideImage(direction: String){
        
        // スライド先の指定により、スライド先のX座標と画像のインデックスを変更
        if direction == "left" {
            translationX = self.scrollView.frame.size.width
            imageIndex = imageIndex == 0 ? imageList.endIndex - 1 : imageIndex - 1
        }else if direction == "right" {
            translationX = -(self.scrollView.frame.size.width)
            imageIndex = imageIndex == imageList.endIndex - 1 ? 0 : imageIndex + 1
        }

        self.dummyScrollView.transform = CGAffineTransform(translationX: -(self.translationX), y: 0)
        // スライド成功時に、次の画像の表示と表示位置を調整
        self.dummyImageView.image = UIImage.init(named: self.imageList[self.imageIndex])

        
        //　スライドアニメーション
        UIView.animate(withDuration: 1, animations: {
            //　スライドの実行
            self.scrollView.transform = CGAffineTransform(translationX: self.translationX, y: 0)
            //　スライドの実行
            self.dummyScrollView.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: {finished in
            // スライド成功時に、次の画像の表示と表示位置を調整
            self.imageView.image = UIImage.init(named: self.imageList[self.imageIndex])
            self.scrollView.transform =  CGAffineTransform(translationX: 0, y: 0)
            // UIView.animate(withDuration: 1, animations: {self.scrollView.transform =  CGAffineTransform(translationX: 0, y: 0)})
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初期画像の読み込み
        imageView.image = UIImage.init(named: "image1")
        
    }


}

