import UIKit

final class WelcomeSignupViewController: BaseViewController {
    
    private let signupSuccessImageView = UIImageView().then{
        $0.image = UIImage(named: "SignUp_Success_image")
        $0.clipsToBounds = true
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "가입 완료!"
        $0.font = .hi_MSG(size: 25, family: .bold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let subWelcomeLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "다시 한 번 환영해요!\n이제Hi를 이용해 볼까요?"
        $0.textAlignment = .center 
        $0.font = .hi_MSG(size: 20, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let nextStepButton = UIButton().then {
        $0.setTitle("알겠어요!", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 23, family: .semiBold)
        $0.backgroundColor = UIColor(rgb: 0xFFC033)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextStepButton.layer.cornerRadius = 20
    }
    
    override func addView() {
        view.addSubviews(signupSuccessImageView, welcomeLabel, subWelcomeLabel, nextStepButton)
    }
    
    override func setLayout() {
        self.signupSuccessImageView.snp.makeConstraints {
            $0.bottom.equalTo(self.welcomeLabel.snp.top).inset(-28)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(128)
            $0.height.equalTo(128)
        }
        self.welcomeLabel.snp.makeConstraints { 
            $0.top.equalTo(self.view).offset(381)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view).inset(401)
        }
        self.subWelcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.welcomeLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        self.nextStepButton.snp.makeConstraints {
            $0.top.equalTo(self.subWelcomeLabel).offset(126)
            $0.leading.equalTo(self.view).offset(20)
            $0.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(60)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationItem.hidesBackButton = true
     }
    
    override func bind() {
        nextStepButton.addTarget(for: .touchUpInside) { _ in
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
