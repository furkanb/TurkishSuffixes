import Foundation
public struct TurkishSuffixes {
    enum TurkishVowel: String, CustomStringConvertible, CaseIterable {
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
        func harmonicVowel(_ suffix: TurkishSuffix)->TurkishVowel {
            switch suffix {
            case .kelimeyi, .kelimenin:
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
            default:
                switch self {
                case let self where self.isThick:
                    return .a
                default:
                    return .e
                }
            }
        }
    }
    
    enum TurkishSuffix: String, CaseIterable {
        case kelimeye,kelimeyi,kelimenin,kelimeyle,kelimede,kelimeden
        var consonantSupport:String {
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
        let trVowels = TurkishVowel.allCases.map {Character($0.rawValue)}
        let trHardCons = TurkishHardConsonant.allCases.map{Character($0.rawValue)}
        guard let lastCharacter = string.last else {return string}
        guard let lastTurkishVowel = string.last(where: trVowels.contains) else {return string}
        guard let lastVowel = TurkishVowel(rawValue: String(lastTurkishVowel)) else { return string}
        let isLastCharVowel: Bool = trVowels.contains(lastCharacter)
        let endsWithHardConsonant: Bool = trHardCons.contains(lastCharacter)

        let softenTheRoot =
        !isProperName
        && (suffix == .kelimeye || suffix == .kelimenin || suffix == .kelimeyi)
        && !(string.count == 4 && Array(string).suffix(2) == ["n", "k"])
        && (string.count <= 6 ? ["p", "ç", "t", "k"].contains(lastCharacter) : ["p", "ç", "k"].contains(lastCharacter))
        && lastVowel != .e && lastVowel != .ı && lastVowel != .u
        &&  string.count > 3;
        
        var root = string
        if(softenTheRoot) {
            guard let softer = TurkishSofterRoot(rawValue: "\(root.popLast() ?? Character(""))") else {return string}
            root.append(softer.softened)
        }
        let result = root +
        "\(isProperName ? apostroph : "")" +
        "\(isLastCharVowel ? suffix.consonantSupport : "")" +
        "\(endsWithHardConsonant ? suffix.preVowelHard : suffix.preVowel)" +
        lastVowel.harmonicVowel(suffix).rawValue +
        suffix.postVowel
        
        return result
    }
    
}
