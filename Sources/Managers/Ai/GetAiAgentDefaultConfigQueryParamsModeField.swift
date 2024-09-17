import Foundation

public enum GetAiAgentDefaultConfigQueryParamsModeField: String, CodableStringEnum {
    case ask
    case textGen = "text_gen"
    case extract
    case extractStructured = "extract_structured"
}
