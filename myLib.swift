/*
* Int에 대한 증감 연산자
*/

prefix func ++(value: inout Int) -> Int {
    value+=1
    return value
}

postfix func ++(value: inout Int) -> Int {
    let postValue = value
    value+=1
    return postValue
}

prefix func --(value: inout Int) -> Int {
    value-=1
    return value
}

postfix func --(value: inout Int) -> Int {
    let postValue = value
    value-=1
    return postValue
}


/*
* String 커스텀
* 문자 존재유무 확인
* 세자리마다 콤마 삽입
*/

extension String {

    func exist(_ char: Character) -> Bool {
        let arr = Array(self)
        
        for i in arr {
            if i == char { return true }
        }
        
        return false
    }
    
    var insertComma: String{
        var arr = Array(self)
        var startIndex: Int, endIndex: Int
        var count: Int = 0
        
        endIndex = arr.count-1
        
        while endIndex > 0{
            while endIndex > 0 && arr[endIndex] < "0" && arr[endIndex] > "9" { endIndex-=1 }
            startIndex = endIndex
            while startIndex > 0 && (arr[startIndex] == "." || (arr[startIndex] >= "0" && arr[startIndex] <= "9")){
                
                if startIndex > 0 && arr[startIndex] == "." { endIndex = startIndex-1 }
                startIndex-=1
            }
            
            if startIndex == -1 { startIndex = 0 }
            
            count = 0
            
            while endIndex > 0 && startIndex < endIndex{
                count+=1
                
                if endIndex > 0 && count == 3 && arr[endIndex-1] >= "0" && arr[endIndex-1] <= "9"{
                    arr.insert(",", at: endIndex)
                    count = 0
                }
                endIndex-=1
            }
            endIndex-=1
        }
        
        return String(arr)
    }
}
