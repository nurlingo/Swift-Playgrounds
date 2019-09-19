func repeatedString(s: String, n: Int) -> Int {
    if n < s.count {
        let ss = s.prefix(s.count - n + 1)
        return ss.filter { $0 == "a" }.count
    }
    let remaining = n % s.count
    let ss = s.prefix(remaining)
    return (s.filter { $0 == "a" }.count * (n / s.count)) + ss.filter  { $0 == "a" }.count
}
