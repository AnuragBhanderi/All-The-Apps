//
//  ViewController.swift
//  Biometric Auth
//
//  Created by Anurag Bhanderi on 08/07/21.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    var context = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        context.localizedCancelTitle = "End Session"
        context.localizedFallbackTitle = "Use Passcode"
        context.localizedReason = "Verify That's you, not anyone else.."
        context.touchIDAuthenticationAllowableReuseDuration = LATouchIDAuthenticationMaximumAllowableReuseDuration
        
        evaluatePolicy()
    }

    func evaluatePolicy() {
        var errorCanEval: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &errorCanEval) {
            
            switch context.biometryType {
            case .faceID:
                print("Face ID")
            case .touchID:
                print("Touch ID")
            case .none:
                print("None")
            default:
                print("Unknown")
            }
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Fallback Title..") { (success, error) in
                print(success)
                if let err = error{
                    let evalErrCode = LAError(_nsError: err as NSError)
                    switch evalErrCode.code {
                    case LAError.Code.userCancel:
                        print("User Cancelled...")
                    case LAError.Code.userFallback:
                        print("FallBack...")
                    case LAError.Code.authenticationFailed:
                        print("User Authentication Failed...")
                    default:
                        print("Error not seems to be Known...")
                    }
                }
            }
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (t) in
                self.context.invalidate()
            }
        }
        else{
            print("Can't Evaluate...")
            print(errorCanEval?.localizedDescription ?? "No Description..")
            if let err = errorCanEval{
                let evalErrCode = LAError(_nsError: err as NSError)
                switch evalErrCode.code {
                case LAError.Code.biometryNotEnrolled:
                    print("Not Enrolled...")
//                    self.sendToSettings()
                default:
                    print("Error not seems to be Known...")
                }
            }
        }
    }

}

