//
//  BreinViewController.swift
//  ios_BRAIN_PUMP_UP
//
//  Created by r_murata on 2024/03/01.
//

import UIKit

class BrainViewController: UIViewController, PopUpViewControllerDelegate {
    func okButtonTapped() {
        print("ダイアログのOKボタンがタップされました")
        // ダイアログのOKボタンがタップされた
        self.dismiss(animated: true) {
            // ダイアログが閉じた後にMainViewControllerを表示
            let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: true, completion: nil)
        }
    }
    
    
    private var time:Double = 0.0
    private var timer:Timer = Timer()
    private var doTimer:Bool = false
    
    // キャラ表示用のUIImageView
    @IBOutlet weak var charaImage: UIImageView!
    // 経過時間
    @IBOutlet weak var timeLabel: UILabel!
    
    // アニメーション用配列
    var imageArrayAttack : Array<UIImage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アニメーションする画像を配列に格納
        while let attackImage = UIImage(named: "image\(imageArrayAttack.count+1)") {
            imageArrayAttack.append(attackImage)
        }
    }
    
    // アニメーションをスタートさせる
    @IBAction func attackBtn(_ sender: Any) {
        // アニメーションの適用
        charaImage.animationImages = imageArrayAttack
        // 間隔
        charaImage.animationDuration = 2
        // 1回繰り返し
        charaImage.animationRepeatCount = 2
        // アニメーションを開始
        charaImage.startAnimating()
        
        startTimer()
    }
    
    // タイマーストップボタン
    @IBAction func stop(_ sender: Any) {
        stopTimer()
    }
    
    // 筋トレ終了ボタン
    @IBAction func endAction(_ sender: Any) {
        UserDefaultsManager.saveData(timeLabel.text!, key: UserDefaultsManager.timeDataKey)
        // ポップアップを表示する
        let popUpView = PopUpViewController()
        popUpView.delegate = self // デリゲートを設定
        
        popUpView.appear(sender: self)
        
        stopTimer()
    }
    
    private func startTimer() {
        
        if (!self.doTimer) {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [self] _ in
                self.time += 0.01
                let minutes = Int(self.time / 60)
                let second = Int(self.time) % 60
                self.timeLabel.text = String(format: "%02d:%02d", minutes, second)
            })
            self.doTimer = true
        }
        
    }
    
    private func stopTimer() {
        self.timer.invalidate()
        self.doTimer = false
    }
    
    
    // データの保存
    //    UserDefaultsManager.saveData("Hello, UserDefaults!")
    //
    //    // 保存したデータの取り出し
    //    if let retrievedData = UserDefaultsManager.retrieveData() {
    //        print("Retrieved Data: \(retrievedData)")
    //    } else {
    //        print("No data found.")
    //    }
    //
    //    // 保存したデータの削除
    //    UserDefaultsManager.removeData()
    
}
