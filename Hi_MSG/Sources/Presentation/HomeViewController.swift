import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

final class HomeViewController: BaseViewController {
    
    private let main_notice = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xF4BD55)
    }
    
    private let title_text = UILabel().then {
        $0.text = "오늘의 공지사항"
        $0.numberOfLines = 1
        $0.font = .hi_MSG(size: 24, family: .black)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let contents_text = UILabel().then {
        $0.text = "11월 24일(목)은 전공동아리로 인하여\n홈베이스를 신청할 수 없습니다.\n이용에 착오 없으시길 바랍니다."
        $0.numberOfLines = 0
        $0.font = .hi_MSG(size: 16, family: .bold)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let from_text = UILabel().then {
        $0.text = "-이명규T"
        $0.numberOfLines = 1
        $0.font = .hi_MSG(size: 14, family: .medium)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let reservation_status = UILabel().then {
        $0.font = .hi_MSG(size: 24, family: .bold)
        $0.text = "예약 현황"
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let seat1 = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    private let seat2 = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    private let seat3 = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    private let seat4 = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0xF2F2F2)
        let HI_LOGO_2 = UIImage(named: "HI_LOGO_2")
        let leftButtonItem = UIBarButtonItem(image: HI_LOGO_2, style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButtonItem
        
        let largeFont = UIFont.systemFont(ofSize: 60)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        
        let person_circle = UIImage(systemName: "person.circle.fill", withConfiguration: configuration)
        let rightButtonItem = UIBarButtonItem(image: person_circle, style: .plain, target: self, action: nil)
        rightButtonItem.width = 16
        //        rightButtonItem.tintColor = .systemGray
        
        let bell_badge = UIImage(systemName: "bell.badge.fill", withConfiguration: configuration)
        let rightButtonItem2 = UIBarButtonItem(image: bell_badge, style: .plain, target: self, action: nil)
        rightButtonItem2.width = 16
        //        rightButtonItem2.tintColor = .systemGray
        
        navigationItem.rightBarButtonItems = [rightButtonItem2, rightButtonItem]
    }
    
    override func addView() {
        view.addSubviews(
            main_notice,
            title_text,
            contents_text,
            from_text,
            reservation_status,
            seat1,
            seat2,
            seat3,
            seat4
        )
    }
    
    override func setLayout() {
        self.main_notice.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(212)
        }
        self.title_text.snp.makeConstraints {
            $0.top.equalTo(self.main_notice.snp.top).inset(20)
            $0.leading.equalTo(self.view).inset(24)
        }
        self.contents_text.snp.makeConstraints {
            $0.top.equalTo(self.title_text.snp.bottom).offset(8)
            $0.leading.equalTo(self.view).inset(24)
        }
        self.from_text.snp.makeConstraints {
            $0.bottom.equalTo(self.main_notice.snp.bottom).inset(30)
            $0.leading.equalTo(self.view).offset(24)
        }
        self.reservation_status.snp.makeConstraints {
            $0.top.equalTo(self.main_notice.snp.bottom).offset(20)
            $0.leading.equalTo(self.view).offset(10)
        }
        self.seat1.snp.makeConstraints {
            $0.top.equalTo(self.reservation_status.snp.bottom).offset(8)
            $0.leading.equalTo(self.view).offset(22)
            $0.width.equalTo(161)
            $0.height.equalTo(161)
        }
        self.seat2.snp.makeConstraints {
            $0.top.equalTo(self.reservation_status.snp.bottom).offset(8)
            $0.leading.equalTo(self.seat1.snp.trailing).offset(10)
            $0.width.equalTo(161)
            $0.height.equalTo(161)
        }
        self.seat3.snp.makeConstraints {
            $0.top.equalTo(self.seat1.snp.bottom).offset(10)
            $0.leading.equalTo(self.view).offset(22)
            $0.width.equalTo(161)
            $0.height.equalTo(161)
        }
        self.seat4.snp.makeConstraints {
            $0.top.equalTo(self.seat1.snp.bottom).offset(10)
            $0.leading.equalTo(self.seat3.snp.trailing).offset(10)
            $0.width.equalTo(161)
            $0.height.equalTo(161)
        }
    }
}
