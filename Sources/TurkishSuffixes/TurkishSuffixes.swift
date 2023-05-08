import Foundation
public struct TurkishSuffixes {
    enum TurkishVowel: String, CustomStringConvertible {
        var description: String {
            return self.rawValue
        }
        case a,e,o,ö,u,ü,ı,i
        var isFlat: Bool {
            self == .a || self == .e || self == .ı || self == .i
        }
        var isRound: Bool {
            self == .o || self == .u || self == .ö || self == .ü
        }
        var isThin: Bool {
            self == .e || self == .i || self == .ö || self == .ü
        }
        var isThick: Bool {
            self == .a || self == .ı || self == .o || self == .u
        }
        var kelimeyi: TurkishVowel {
            switch self {
            case let self where self.isThick && self.isFlat:
                return .ı
            case let self where self.isThin && self.isFlat:
                return .i
            case let self where self.isThick && self.isRound:
                return .u
            case let self where self.isThin && self.isRound:
                return .ü
            default:
                return .i
            }
        }
        var kelimenin: TurkishVowel {
            switch self {
            case .a, .ı:
                return .ı
            case .e, .i:
                return .i
            case .o, .u:
                return .u
            case .ü, .ö:
                return .ü
            }
        }
        var kelimeye: TurkishVowel {
            switch self {
            case let self where self.isThick:
                return .a
            default:
                return .e
            }
        }
        var kelimede: TurkishVowel {
            switch self {
            case let self where self.isThick:
                return .a
            default:
                return .e
            }
        }
        var kelimeden: TurkishVowel {
            switch self {
            case let self where self.isThick:
                return .a
            default:
                return .e
            }
        }
        var kelimeyle: TurkishVowel {
            switch self {
            case let self where self.isThick:
                return .a
            default:
                return .e
            }
        }
    }
    
    enum TurkishSuffix: String, CaseIterable {
        case kelimenin,kelimeye,kelimeyi,kelimede,kelimeden,kelimeyle
        var isLastVowel:String {
            switch self {
            case .kelimenin:
                return "n"
            case .kelimeye, .kelimeyi, .kelimeyle:
                return "y"
            default:
                return ""
            }
        }
        var preVowel:String {
            switch self {
            case .kelimede, .kelimeden:
                return "d"
            case .kelimeyle:
                return "l"
            default:
                return ""
            }
        }
        var preVowelHard:String {
            switch self {
            case .kelimede, .kelimeden:
                return "t"
            case .kelimeyle:
                return "l"
            default:
                return ""
            }
        }
        var postVowel:String {
            switch self {
            case .kelimenin, .kelimeden:
                return "n"
            default:
                return ""
            }
        }
        
    }
    enum TurkishHardConsonant: String, CaseIterable {
        case ç,f,h,k,p,s,ş,t
    }
    enum TurkishSofterRoot: String {
        case p,ç,t,k
        var softened: String {
            switch self {
            case .p:
                return "b"
            case .ç:
                return "c"
            case .t:
                return "d"
            case .k:
                return "ğ"
            }
        }
    }
    func addTurkishSuffix(_ string: String, _ suffix: TurkishSuffix, _ isProperName: Bool = false, _ apostroph: String = "'") -> String {
        guard let lastTurkishVowel = string.last(where: ["a","e","ı","i","o","ö","u","ü"].contains) else {return string}
        guard let lv = TurkishVowel(rawValue: String(lastTurkishVowel)) else { return string}
        var harmonicVowel:String {
            switch suffix {
            case .kelimede:
                return lv.kelimede.rawValue
            case .kelimeden:
                return lv.kelimeden.rawValue
            case .kelimenin:
                return lv.kelimenin.rawValue
            case .kelimeye:
                return lv.kelimeye.rawValue
            case .kelimeyi:
                return lv.kelimeyi.rawValue
            case .kelimeyle:
                return lv.kelimeyle.rawValue
            }
        }
        let isLastCharVowel = ["a","e","ı","i","o","ö","u","ü"].contains(string.last)
        let endsWithHardConsonant = ["ç","f","h","k","p","s","ş","t"].contains(string.last)
        
        let softenTheRoot = (suffix == .kelimeye || suffix == .kelimenin || suffix == .kelimeyi)
        && ( string.count <= 6 ?["p", "ç", "t", "k"].contains(string.last) : ["p", "ç", "k"].contains(string.last))
        && !isProperName && string.count > 3;
        
        var root = string
        if(softenTheRoot) {
            guard let softer = TurkishSofterRoot(rawValue: "\(root.popLast() ?? Character(""))") else {return string}
            root.append(softer.softened)
        }
        let result = root +
        "\(isProperName ? apostroph : "")" +
        "\(isLastCharVowel ? suffix.isLastVowel : "")" +
        "\(endsWithHardConsonant ? suffix.preVowelHard : suffix.preVowel)" +
        harmonicVowel +
        suffix.postVowel
        
        return result
    }
    
}
