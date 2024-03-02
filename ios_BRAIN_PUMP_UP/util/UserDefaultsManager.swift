//
//  SharedPreferences.swift
//  ios_BRAIN_PUMP_UP
//
//  Created by r_murata on 2024/03/01.
//

import Foundation

// 端末内にデータを保存したり、取り出したりするクラス
class UserDefaultsManager: NSObject {
    // UserDefaultsのキーを定義
    private static let timeDataKey = "SavedTime"
    
    // 保存するデータの型に合わせたクラスメソッド
    static func saveData(_ data: String) {
        print("端末内に経過時間を保存")
        // UserDefaultsにデータを保存
        UserDefaults.standard.set(data, forKey: timeDataKey)
        // 保存を即座に反映させる
        UserDefaults.standard.synchronize()
    }
    
    // 保存したデータを取り出すクラスメソッド
    static func retrieveData() -> String? {
        // UserDefaultsからデータを取り出す
        if let savedData = UserDefaults.standard.string(forKey: timeDataKey) {
            return savedData
        } else {
            return nil
        }
    }
    
    // 保存したデータを削除するクラスメソッド
    static func removeData() {
        UserDefaults.standard.removeObject(forKey: timeDataKey)
        // 削除を即座に反映させる
        UserDefaults.standard.synchronize()
    }
    
    
}
