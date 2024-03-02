//
//  PopUpViewController.swift
//  ios_BRAIN_PUMP_UP
//
//  Created by r_murata on 2024/03/01.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var contentView: UIView!
    // 勉強時間をここに記録する
    @IBOutlet weak var dialogTitle: UILabel!
    
    @IBAction func OnNegativeButton(_ sender: Any) {
        hide()
        // いいえボタンクリック
    }
    
    @IBAction func OnOkButton(_ sender: Any) {
        hide()
        // はいボタンクリック
    }
    
    @IBOutlet weak var mainMessage: UILabel!
    
    init() {
        super.init(nibName: "PopUpViewController", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var time = "初期データー"
              // 保存したデータの取り出し
              if let retrievedData = UserDefaultsManager.retrieveData() {
                  print("端末内から取得したデータ: \(retrievedData)")
                  time = retrievedData
              } else {
                  print("端末内Data: No data found.")
              }
              self.dialogTitle.text = time

        textAdjust()
        configView()
    }
    
    // テキストの行間を広げる
    private func textAdjust() {
        var time = "初期データー"
        // 保存したデータの取り出し
        if let retrievedData = UserDefaultsManager.retrieveData() {
            print("端末内から取得したデータ: \(retrievedData)")
            time = retrievedData
        } else {
            print("端末内Data: No data found.")
        }
        
        let lineSpacing: CGFloat = 8.0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString = NSAttributedString(
            string: time,
            attributes: [
                .paragraphStyle: paragraphStyle
            ]
        )
        dialogTitle.attributedText = attributedString
        dialogTitle.textAlignment = .center
        
        let mainMessageText = "ちょっと行間にスペースを持たせるテキスト\n来週からスリランカに行く！！"
       
            paragraphStyle.lineSpacing = lineSpacing
        
        let attributedString2 = NSAttributedString(
                string: mainMessageText,
                attributes: [
                    .paragraphStyle: paragraphStyle
                ]
            )
        mainMessage.attributedText = attributedString2
        mainMessage.textAlignment = .center
    }

    func configView() {
        self.view.backgroundColor = .clear
        self.backView.backgroundColor = .black.withAlphaComponent(0.6)
        self.backView.alpha = 0
        self.contentView.alpha = 0
        self.contentView.layer.cornerRadius = 10
    }

    
    func appear(sender: UIViewController) {
        sender.present(self, animated: false) {
            self.show()
        }
    }
    
    private func show() {
        UIView.animate(withDuration: 1, delay:0.1) {
            self.backView.alpha = 1
            self.contentView.alpha = 1
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut) {
            self.backView.alpha = 0
            self.contentView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }
}
