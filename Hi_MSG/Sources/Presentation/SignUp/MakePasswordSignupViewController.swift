import UIKit

final class MakePasswordSignupViewController: BaseViewController {
    
    private var nextStep: Bool = false
    
    private let welcomeLabel = UILabel().then {
        $0.text = "비밀번호 만들기"
        $0.font = .hi_MSG(size: 34, family: .extraBold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let subWelcomeLabel = UILabel().then {
        $0.text = "아무도 모를 비밀번호를 만들어주세요!"
        $0.font = .hi_MSG(size: 16, family: .semiBold)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let passwordExplainLabel = UILabel().then {
        $0.text = "비밀번호를 알려주세요!"
        $0.font = .hi_MSG(size: 12, family: .medium)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    private let passwordTextField = UITextField().then {
        $0.borderStyle = .none
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .hi_MSG(size: 17, family: .regular)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    private let passwordCheckExplainLabel = UILabel().then {
        $0.text = "다시 한 번 말해주실래요?"
        $0.font = .hi_MSG(size: 12, family: .medium)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    private let passwordCheckTextField = UITextField().then {
        $0.borderStyle = .none
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .hi_MSG(size: 17, family: .regular)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private let underLine2View = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    private let nextStepButton = UIButton().then {
        $0.setTitle("회원가입 하기", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 22, family: .semiBold)
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.addTarget(self, action: #selector(nextStepButtonDidTap), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubviews(welcomeLabel, subWelcomeLabel, passwordExplainLabel, passwordTextField, underLineView, passwordCheckExplainLabel, passwordCheckTextField, underLine2View, nextStepButton)
    }
    
    override func setLayout() {
        self.welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(87)
            $0.leading.equalTo(self.view).offset(16)
        }
        self.subWelcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.welcomeLabel.snp.bottom)
            $0.leading.equalTo(self.welcomeLabel.snp.leading).inset(1)
        }
        self.passwordExplainLabel.snp.makeConstraints {
            $0.top.equalTo(self.subWelcomeLabel.snp.bottom).offset(123)
            $0.leading.equalTo(self.view).offset(20)
        }
        self.passwordTextField.snp.makeConstraints {
            $0.top.equalTo(self.passwordExplainLabel.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(24)
            $0.trailing.equalTo(self.view).inset(24)
        }
        self.underLineView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(20)
            $0.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(2)
        }
        self.passwordCheckExplainLabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineView.snp.bottom).offset(32)
            $0.leading.equalTo(self.view).offset(21)
        }
        self.passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(self.passwordCheckExplainLabel.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(24)
            $0.trailing.equalTo(self.view).inset(24)
        }
        self.underLine2View.snp.makeConstraints {
            $0.top.equalTo(self.passwordCheckTextField.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(20)
            $0.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(2)
        }
        self.nextStepButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    
    @objc private func textFieldDidChange(_ sender: Any?) {
        if passwordTextField.text == passwordCheckTextField.text &&
            8...16 ~= passwordTextField.text?.count ?? 0 {
            let password: String = passwordCheckTextField.text ?? ""
            let psPattern = "^(?=.*[!@#$%^&*()_+=-])"
            let isContains = password.range(of: psPattern, options: .regularExpression) != nil
            if isContains == true {
                nextStepButton.backgroundColor = UIColor(rgb: 0xFFC033)
                nextStep = true
            }
        }
        else {
            nextStepButton.backgroundColor = UIColor(rgb: 0x999999)
            nextStep = false
        }
    }
    
    @objc private func nextStepButtonDidTap(_ sender: UIButton){
        if nextStep == true {
            let vc = WelcomeSignupViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

