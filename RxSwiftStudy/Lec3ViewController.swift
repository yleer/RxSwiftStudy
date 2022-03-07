//
//  Lec3ViewController.swift
//  RxSwiftStudy
//
//  Created by Yundong Lee on 2022/03/07.
//

import UIKit
import RxSwift
import RxCocoa

class Lec3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        // PublishSubject를 만들었다.
//        let subject = PublishSubject<String>()
//
//             // 2
//        subject.onNext("Is anyone listening?")
//
//             // 3
//         let subscriptionOne = subject
//             .subscribe(onNext: { (string) in
//                 print(string)
//         })
//
//             // 4
//         subject.on(.next("1"))        //Print: 1
//
//         // 5
//         subject.onNext("2")        //Print: 2
        
        let subject = PublishSubject<String>()
        subject.onNext("Is anyone listening?")

        
        // 이전에 있는 이벤트 무시. 앞으로 있을 이벤트만 처리
        let subscriptionOne = subject
             .subscribe(onNext: { (string) in
                 print(string)
         })
        
        
         subject.on(.next("1")) // print 1
         subject.onNext("2") // print 2

         // 1
        // 이전에 있는 이벤트 무시. 앞으로 있을 이벤트만 처리
        // 새로운 이벤트 들어오면 아래의 프린트 문 출력
         let subscriptionTwo = subject
             .subscribe({ (event) in
                 print("2)", event.element ?? event)
             })

         // 2
         subject.onNext("3")  // subscriptionOne, subscriptionTwo에 의해 두개 출력됨

         // 3
         subscriptionOne.dispose()  // subscriptionOne 버려서 아래 4 출려 X
         subject.onNext("4")

         // 4  subject 완전 종료 처리.  subscriptionTwo 프린트 문 실행됨
         subject.onCompleted()

         // 5
         subject.onNext("5") // subject 완료 처리돼서 처리 x

         // 6
         subscriptionTwo.dispose()  //subscriptionTwo 버리기

         let disposeBag = DisposeBag()

         // 7
         subject
             .subscribe {
                 print("3)", $0.element ?? $0)
         }
             .disposed(by: disposeBag)

         subject.onNext("?")
        
    }
    


}
