//
//  ViewController.swift
//  SocialLogin
//
//  Created by Johyeon Yoon on 2021/05/25.
//

import UIKit
import KakaoSDKUser


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpKakaoLogin(_ sender : Any) {
//        // 카카오톡 설치여부 확인
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    // 예외처리
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//        }
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoTalk() success.")
               //
               //                    //do something
                _ = oauthToken
            }
            
        }
        
    }
    
}
