
using Random

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

function selectionSort_jl(setA)
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
    #outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_Program_1/julia/selectionSort.txt", "a")
    #write(outFile, "\n")
    swap1 = getswap(count)
    comp = getcomp(count)
    print("loopcount: $comp", "swapCount: $swap1") #outfile
    #close(outFile)
    return setA
end

function insertionSort_jl(filePath)
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
        #outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/insertionSort.txt", "a")
        print("\nloopcount: $loopcount", " swapCount: $swapcount") #write outfile
        #close(outFile)
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
function mergeSort_jl(setA)
        count1 = _Counter(0, 0)
        _mergeSort(setA, 1, length(setA), count1)
        #outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/mergeSort.txt", "a")
        #write(outFile, "\n")
        swap1 = getswap(count1)
        comp = getcomp(count1)
        print("swap: $swap1   comp: $comp")#write outfile
        #close(outFile)
        return setA
end
A =[45, 62, 98, 89, 47, 59, 72, 82, 45, 18]
function bucketSort_jl(setA)
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
        #outFile = open("/Users/michaelzabawa/Documents/GitHub/Sorting_algorithms_julia/bucketSort.txt", "a")
        #write(outFile, "\n")
        print("loopcount: $count")#write out file
        #close(outFile)
        return setA
end
timeData = [10,100,1000,5000,10000,20000,30000,40000, 70000,100000]
function test()
        for n in timeData
                for i in 2
                        setA = rand(1:n, n)
                        @time selectionSort_jl(setA)
                end
        end
end


# timeData$julia = c(0.000069,0.000050,0.000814,0.013179,0.048383,
#           0.183329,0.39476, 0.732856,2.226240,4.450899)
# timeData2$Python = c(0.00012699999999910005, 0.0008890000000008058,
#                      0.08205999999999847, 1.4835370000000019, 6.016622999999999,
#                      24.007714999999997,67.132768,112.74782499999999,NA,NA)
