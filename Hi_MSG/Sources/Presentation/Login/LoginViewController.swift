import Foundation
import UIKit
import SnapKit
import Then

final class LoginViewController: BaseViewController {
    
    private let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    private let welcomeUILabel = UILabel().then {
        $0.text = "돌아오셨네요!"
        $0.font = .hi_MSG(size: 34, family: .extraBold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let subWelcomeUILabel = UILabel().then {
        $0.text = "다시 만나서 반가워요!"
        $0.font = .hi_MSG(size: 16, family: .semiBold)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let idExplainUILabel = UILabel().then {
        $0.text = "이메일을 알려주세요!"
        $0.font = .hi_MSG(size: 12, family: .medium)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    private let idTextField = UITextField().then{
        $0.borderStyle = .none
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .hi_MSG(size: 17, family: .regular)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let pwExplainUILabel = UILabel().then {
        $0.text = "비밀번호를 써주세요!"
        $0.font = .hi_MSG(size: 12, family: .medium)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    private let idUnderLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    private let pwTextField = UITextField().then{
        $0.borderStyle = .none
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .hi_MSG(size: 17, family: .regular)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(buttonColorChange), for: .editingChanged)
    }
    
    private let signupUIButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 16, family: .medium)
    }
    
    private let findPasswordUIButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x999999), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 16, family: .medium)
    }
    
    private let nextStepUIButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 24, family: .semiBold)
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    private let pwUnderLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    private let betweenSignupAndPwUIButton = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xFFD068)
    }
    
    override func addView() {
        view.addSubviews(idTextField,pwTextField,welcomeUILabel,subWelcomeUILabel,idExplainUILabel,pwExplainUILabel,nextStepUIButton,idUnderLineView,pwUnderLineView,signupUIButton,findPasswordUIButton,betweenSignupAndPwUIButton)
    }
    override func setLayout() {
        self.welcomeUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(87)
            $0.leading.equalTo(self.view).offset(16)
        }
        self.subWelcomeUILabel.snp.makeConstraints{
            $0.top.equalTo(self.welcomeUILabel.snp.bottom)
            $0.leading.equalTo(self.welcomeUILabel.snp.leading).inset(1)
        }
        self.idExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.subWelcomeUILabel.snp.bottom).offset(116)
            $0.leading.equalTo(self.view).offset(20)
            
        }
        self.idTextField.snp.makeConstraints{
            $0.top.equalTo(self.idExplainUILabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(self.view).offset(24)
        }
        self.idUnderLineView.snp.makeConstraints{
            $0.top.equalTo(idExplainUILabel.snp.bottom).offset(36)
            $0.leading.trailing.equalTo(self.view).offset(20)
            $0.height.equalTo(2)
        }
        self.pwExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(40)
            $0.leading.equalTo(self.view).offset(20)
        }
        self.pwTextField.snp.makeConstraints{
            $0.top.equalTo(self.pwExplainUILabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.view).offset(24)
            $0.trailing.equalTo(self.view).offset(185)
        }
        self.pwUnderLineView.snp.makeConstraints{
            $0.top.equalTo(pwExplainUILabel.snp.bottom).offset(36)
            $0.leading.trailing.equalTo(self.view).offset(20)
            $0.height.equalTo(2)
        }
        self.findPasswordUIButton.snp.makeConstraints{
            $0.top.equalTo(pwUnderLineView.snp.bottom).offset(24)
            $0.leading.equalTo(self.view).inset(268)
        }
        self.betweenSignupAndPwUIButton.snp.makeConstraints{
            $0.top.equalTo(pwUnderLineView.snp.bottom).offset(30)
            $0.trailing.equalTo(findPasswordUIButton.snp.leading).offset(-12)
            $0.height.equalTo(19)
            $0.width.equalTo(1)
        }
        self.signupUIButton.snp.makeConstraints{
            $0.top.equalTo(pwUnderLineView.snp.bottom).offset(24)
            $0.trailing.equalTo(betweenSignupAndPwUIButton.snp.leading).offset(-12)
        }
        self.nextStepUIButton.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    
    @objc func buttonColorChange(_ sender: Any?) {
        nextStepUIButton.backgroundColor = UIColor(rgb :pwTextField.text?.count ?? 0 >= 1 ?  0xFFC033 : 0x999999 )
    }
    
    override func bind() {
        signupUIButton.addTarget(for: .touchUpInside) { _ in
            let vc = NameSignupViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
