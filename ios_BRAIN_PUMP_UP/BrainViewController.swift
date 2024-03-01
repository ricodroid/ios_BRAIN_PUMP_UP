//
//  BreinViewController.swift
//  ios_BRAIN_PUMP_UP
//
//  Created by r_murata on 2024/03/01.
//

import UIKit

class BrainViewController: UIViewController {
    
    // キャラ表示用のUIImageView
    @IBOutlet weak var charaImage: UIImageView!
    
    // アニメーション用配列
    var imageArrayAttack : Array<UIImage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // アニメーションする画像を配列に格納
        while let attackImage = UIImage(named: "image\(imageArrayAttack.count+1)") {
            imageArrayAttack.append(attackImage)
        }
    }


    @IBAction func attackBtn(_ sender: Any) {
        // アニメーションの適用
        charaImage.animationImages = imageArrayAttack
        // 1.5秒間隔
        charaImage.animationDuration = 1.5
        // 1回繰り返し
        charaImage.animationRepeatCount = 2
        // アニメーションを開始
        charaImage.startAnimating()
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
