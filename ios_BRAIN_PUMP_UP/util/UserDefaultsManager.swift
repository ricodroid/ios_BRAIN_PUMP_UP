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
    public static let timeDataKey = "SavedTime"
    public static let totalTimeDataKey = "TotalSavedTime"
    
    // 保存するデータの型に合わせたクラスメソッド
    static func saveData(_ data: String, key: String) {
        print("端末内にデータを保存")
        // UserDefaultsにデータを保存
        UserDefaults.standard.set(data, forKey: key)
        // 保存を即座に反映させる
        UserDefaults.standard.synchronize()
    }
    
    // 保存したデータを取り出すクラスメソッド
    static func retrieveData(key: String) -> String? {
        // UserDefaultsからデータを取り出す
        if let savedData = UserDefaults.standard.string(forKey: key) {
            return savedData
        } else {
            return nil
        }
    }
    
    // 保存したデータを削除するクラスメソッド
    static func removeData(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        // 削除を即座に反映させる
        UserDefaults.standard.synchronize()
    }
    
    
}
