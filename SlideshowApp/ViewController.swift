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
    // 次へボタン用のIBOutlet
    @IBOutlet weak var nextButtonOutlet: UIButton!
    // 戻るボタン用のIBOutlet
    @IBOutlet weak var backButtonOutlet: UIButton!
    // 再生・停止ボタン用のIBOutlet
    @IBOutlet weak var playStopButtonOutlet: UIButton!
    
    
    // 進むボタンのIBAction
    @IBAction func nextButton(_ sender: Any) {
        slideImage(direction: "right")
    }
    // 戻るボタンのIBAction
    @IBAction func backButton(_ sender: Any) {
        slideImage(direction: "left")
    }
    
    // 自動スライド設定
    var autoSlideTimer: Timer? = nil
    
    // 再生・停止ボタンのIBAction
    @IBAction func playStopButton(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.autoSlideTimer == nil {
            self.autoSlideTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoSlideImage(_:)), userInfo: nil, repeats: true)
            self.playStopButtonOutlet.setTitle("停止", for: .normal)
            self.nextButtonOutlet.isEnabled = false
            self.backButtonOutlet.isEnabled = false
        }else {
            self.autoSlideTimer!.invalidate()
            self.autoSlideTimer = nil
            self.playStopButtonOutlet.setTitle("再生", for: .normal)
            self.nextButtonOutlet.isEnabled = true
            self.backButtonOutlet.isEnabled = true
        }
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

        // ダミースライドの設定
        // スライド元のX座標を指定
        // ダミー画像を変更
        self.dummyScrollView.transform = CGAffineTransform(translationX: -(self.translationX), y: 0)
        self.dummyImageView.image = UIImage.init(named: self.imageList[self.imageIndex])

        
        //　スライドアニメーション
        UIView.animate(withDuration: 1, animations: {
            //　スライドの実行
            self.scrollView.transform = CGAffineTransform(translationX: self.translationX, y: 0)
            //　ダミースライドの実行
            self.dummyScrollView.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }, completion: {finished in
            // スライド成功時に、次の画像の表示と表示位置を調整
            self.imageView.image = UIImage.init(named: self.imageList[self.imageIndex])
            self.scrollView.transform =  CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    //
    @objc func autoSlideImage(_ timer: Timer){
        slideImage(direction: "right")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初期画像の読み込み
        imageView.image = UIImage.init(named: "image1")
        
    }


}

