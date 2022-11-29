import Foundation
import UIKit
import SnapKit
import Then

final class IntroViewController: BaseViewController{
    // MARK: - Properties
    
    let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    private let logoImageView = UIImageView().then{
        $0.image = UIImage(named: "HI LOGO2")
        $0.clipsToBounds = true
    }

    private let welcomeImageView = UIImageView().then{
        $0.image = UIImage(named: "Welcome_Image")
        $0.clipsToBounds = true // 잘리는거
    }
    
    private let welcomeUILablel = UILabel().then{
        $0.text = "반가워요!"
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 34)
    }
    
    private let introUILablel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x999999)
        $0.text = " Hi에서 홈베이스 신청을\n온라인으로 쉽게 해보아요!"
        $0.numberOfLines = 2
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
    }
    
    private let loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal) //버튼 안에 들어갈 글자 색깔
        $0.backgroundColor =  UIColor(rgb: 0xFFC033)
        $0.layer.cornerRadius = 15 // 버튼 곡률 크기
    }
    
    private let signupButton = UIButton().then{
        $0.setTitle("회원가입하기", for: .normal) // 버튼 안에 들어갈 글자
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal) //버튼 안에 들어갈 글자 색깔
        $0.backgroundColor =  UIColor(rgb: 0xFFC033)
        $0.layer.cornerRadius = 15 // 버튼 곡률 크기
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xFFD068)
    }
    
    // MARK: - Method
    override func addView() {
        view.addSubviews(
            logoImageView,
            welcomeImageView,
            welcomeUILablel,
            introUILablel,
            loginButton,
            signupButton
        )
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(52)
            $0.height.equalTo(32)
            $0.width.equalTo(133)
            $0.leading.equalToSuperview().offset(20)
        }
        welcomeImageView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(88)
            $0.bottom.equalTo(view.snp.bottom).inset(390)
            $0.leading.trailing.equalToSuperview()
        }
        welcomeUILablel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeImageView.snp.bottom).offset(5)
        }
        introUILablel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeUILablel.snp.bottom).offset(4)
        }
        loginButton.snp.makeConstraints{
            $0.top.equalTo(introUILablel.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(50)
        }
        signupButton.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(67)
            $0.height.equalTo(50)
        }
    }
    override func bind() {
        loginButton.addTarget(for: .touchUpInside) { _ in
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        signupButton.addTarget(for: .touchUpInside) { _ in
            let vc = FirstSignUpViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
