
using Random

shuffled = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/test_sets/shuffled.txt"
sorted = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/test_sets/sorted.txt"
unsorted = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/test_sets/unsorted.txt"
nearly_unsorted = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/test_sets/nearly-unsorted.txt"
nearly_sorted = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/test_sets/nearly-sorted.txt"
duplicate = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/test_sets/duplicate.txt"
one_million_randoms = "/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/test_sets/one-million-randoms.txt"

testSet = [shuffled, sorted, nearly_sorted, unsorted, nearly_unsorted, duplicate]
oneMillionSet = [one_million_randoms]
function txtoArray(filePath)
        infile = open(filePath, "r")
        readline(infile)#header
        readline(infile)#first number
        testArray = Int64[]
        for num in readlines(infile)
                push!(testArray, parse(Int64, num))
        end
        close(infile)
        return testArray
end
function swap(setA, index1, index2)
        temp = setA[index1]
        setA[index1] = setA[index2]
        setA[index2] = temp
end
mutable struct _Counter
         swapcount::Int
         compcount::Int
end

function plusswap(x::_Counter, num::Int64)
        x.swapcount += num
end
function pluscomp(x::_Counter, num::Int64)
        x.compcount += num
end
function getswap(x::_Counter)
        return x.swapcount
end
function getcomp(x::_Counter)
        return x.compcount
end

function selectionSort(setA)
    count = _Counter(0,0)
    for i in 1:length(setA)
        min = typemax(Int64)
        index = 0
        for j = i:length(setA)
            pluscomp(count, 1)
            if setA[j] < min
                min = setA[j]
                index = j
            end
        end
        if index != i
                swap(setA, i, index)
                plusswap(count, 1)
        end
    end
    outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/selectionSort.txt", "a")
    write(outFile, "\n")
    swap1 = getswap(count)
    comp = getcomp(count)
    write(outFile, "loopcount: $comp", "swapCount: $swap1")
    close(outFile)
    return setA
end

function insertionSort(filePath)
        loopcount = UInt64(0)
        swapcount = UInt64(0)
        setA = Int64[]
        push!(setA, typemax(Int64))
        infile = open(filePath, "r")
        readline(infile)#header
        readline(infile)#header
        for string in readlines(infile)
                num = parse(Int64, string)
                for i in eachindex(setA)
                    loopcount = loopcount + 1
                    if num < setA[i]
                        insert!(setA, i , num)
                        swapcount = swapcount + 1
                        break
                end
            end
        end
        pop!(setA) #removes Inf
        outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/insertionSort.txt", "a")
        write(outFile, "\nloopcount: $loopcount", " swapCount: $swapcount")
        close(outFile)
        return(setA)
end

function _merge(setA, p, q, r, count1)
        L = setA[p:q]
        R = setA[q+1:r]
        push!(L, typemax(Int64))
        push!(R, typemax(Int64))
        i = Int64(1)
        j = Int64(1)
        for k in p:r
                if L[i] <= R[j]
                        pluscomp(count1, 1)
                        setA[k] = L[i]
                        i = i + 1
                else
                        pluscomp(count1, 1)
                        setA[k] = R[j]
                        j = j + 1
                end
        end

end

function _mergeSort(setA, p, r, count1)

        if p < r
                plusswap(count1, r - p)
                q = floor(Int64, ((p+r)/2))
                _mergeSort(setA, p, q, count1)
                _mergeSort(setA, q + 1, r, count1)
                _merge(setA, p, q, r, count1)
        end
end
function mergeSort(setA)
        count1 = _Counter(0, 0)
        _mergeSort(setA, 1, length(setA), count1)
        outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/mergeSort.txt", "a")
        write(outFile, "\n")
        swap1 = getswap(count1)
        comp = getcomp(count1)
        write(outFile, "swap: $swap1   comp: $comp")
        close(outFile)
        return setA
end
A =[45, 62, 98, 89, 47, 59, 72, 82, 45, 18]
function bucketSort(setA)
        index = Int64(0)
        count = Int64(0)
        bucket = zeros(Int64, 1001)
        for num in setA
                bucket[num + 1] = bucket[num + 1] + 1
                count = count + 1
        end
        for i in 1:1000
                if bucket[i + 1] > 0
                        for num in 1:bucket[i + 1]
                                setA[index + num] = i - 1
                        end
                        index = index + bucket[i + 1]
                end
        end
        outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/bucketSort.txt", "a")
        write(outFile, "\n")
        write(outFile, "loopcount: $count")
        close(outFile)
        return setA
end
function test(test_Set)
        for path in test_Set
                setA = txtoArray(path)
                @time selectionSort(setA)
                setB = txtoArray(path)
                @time mergeSort(setB)
                setC = txtoArray(path)
                @time bucketSort(setC)
        end
end
