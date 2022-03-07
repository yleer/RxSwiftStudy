//
//  ViewController.swift
//  RxSwiftStudy
//
//  Created by Yundong Lee on 2022/03/06.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            // 1
//        let one = 1
//        let two = 2
//        let three = 3
//
//
//        // observable 만드는 연산자들
//        let observable: Observable<Int> = Observable<Int>.just(one)
//        let observable2 = Observable.of(one, two, three)  // 타입은 Observable<Int>
//        let observable3 = Observable.of([one, two, three])  // 타입은 Observable<[Int]>
//        let observable4 = Observable.from([one, two, three]) // 타입은 Observable<Int>
//
//
//
//
//        // observable은 구독하지 않으면 아무것도 실행이 안된다.
//        // 구독을 통해 이벤트 받고 처리.
//        observable2.subscribe { event in
//            print(event)
//        }
//
//        observable2.subscribe { event in
//            print(event)
//        }
//
//        observable2.subscribe(onNext: { event in
//            print(event)
//        })
//
        // 1
             let observable = Observable.of("A", "B", "C")
             
             // 2
             let subscription = observable.subscribe({ (event) in
                 
                 // 3
                 print(event)
             })
             
             subscription.dispose()
        
        
    }


}

