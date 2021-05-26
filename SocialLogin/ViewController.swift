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
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외처리
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    _ = oauthToken
                    // 액세스토큰
                    let accessToken = oauthToken?.accessToken
                    self.setUserInfo()
                }
            }
        }
        // 카카오톡 미설치된 경우
        else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    //do something
                    _ = oauthToken
                    let accessToken = oauthToken?.accessToken
                    self.setUserInfo()
                
                }
                
            }
            
        }
        
    }
    
    @IBOutlet weak var infoLabel : UILabel!
    @IBOutlet weak var emailLabel : UILabel!
    @IBOutlet weak var profileImageView : UIImageView!
    
    func setUserInfo() {
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success")
                _ = user
                self.infoLabel.text = user?.kakaoAccount?.profile?.nickname
                self.emailLabel.text = user?.kakaoAccount?.email
                if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                   let data = try? Data(contentsOf: url){
                    self.profileImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
}
