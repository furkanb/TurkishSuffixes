import XCTest
@testable import TurkishSuffixes

final class TurkishSuffixesTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let testStrings = ["top","başak", "Paşa", "kedi", "kuzu", "kurt", "kağıt", "zaman", "cemiyet", "tank"]

        struct TurkishSuffixesTest {
            var suffix: TurkishSuffixes.TurkishSuffix
            let testStrings = ["top","başak", "Paşa", "kedi", "kuzu", "kurt", "kağıt", "zaman", "cemiyet", "tank"]
            var testAssertion: [String] {
                switch suffix {
                case .kelimenin:
                    return ["topun", "başağın", "Paşa'nın", "kedinin", "kuzunun", "kurdun", "kağıdın", "zamanın", "cemiyetin", "tankın"]
                case .kelimeye:
                    return ["topa", "başağa", "Paşa'ya", "kediye", "kuzuya", "kurda", "kağıda", "zamana", "cemiyete", "tanka"]
                case .kelimeyi:
                    return ["topu", "başağı", "Paşa'yı", "kediyi", "kuzuyu", "kurdu", "kağıdı", "zamanı", "cemiyeti", "tankı"]
                case .kelimede:
                    return ["topta", "başakta", "Paşa'da", "kedide", "kuzuda", "kurtta", "kağıtta", "zamanda", "cemiyette", "tankta"]
                case .kelimeden:
                    return ["toptan", "başaktan", "Paşa'dan", "kediden", "kuzudan", "kurttan", "kağıttan", "zamandan", "cemiyetten", "tanktan"]
                case .kelimeyle:
                    return ["topla", "başakla", "Paşa'yla", "kediyle", "kuzuyla", "kurtla", "kağıtla", "zamanla", "cemiyetle", "tankla"]
                }
            }
        }
        func sentenceEnding(_ suffix: TurkishSuffixes.TurkishSuffix) -> String {
            switch suffix {
            case .kelimeye:
                return "imrenmek"
            case .kelimeyi:
                return "düşünmek"
            case .kelimenin:
                return "farkı"
            case .kelimeyle:
                return "sevinmek"
            case .kelimede:
                return "karar kılmak"
            case .kelimeden:
                return "çekinmek"
            }
        }
        
        TurkishSuffixes.TurkishSuffix.allCases.enumerated().forEach { (index, suffix) in
            let testCheck = TurkishSuffixesTest(suffix: suffix)
            print("--")
            testStrings.enumerated().forEach { (strIndex, str) in
                let testCase = TurkishSuffixes.init().addTurkishSuffix(str, suffix, str.first?.isUppercase ?? false)
                XCTAssertEqual(testCase, testCheck.testAssertion[strIndex])
                print(testCase, sentenceEnding(suffix))
            }
        }

        print("| |",TurkishSuffixes.TurkishSuffix.allCases.map{$0.rawValue}.joined(separator: " | "),"|")
        print("| --- |",TurkishSuffixes.TurkishSuffix.allCases.map{_ in " --- "}.joined(separator: " | "),"|")
            testStrings.enumerated().forEach { (strIndex, str) in
                print("|",str,"|",TurkishSuffixes.TurkishSuffix.allCases.map {
                    let harmonized =  TurkishSuffixes.init().addTurkishSuffix(str,$0, str.first?.isUppercase ?? false)
                    return harmonized /* + " " + sentenceEnding($0)*/
                }.joined(separator: " | "),"|")
            }
    }
}
