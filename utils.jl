function Pr(x1=:all, x2=:all, x3=:all) 
    x1 = x1 == :all ? Set(prs[!,:x1]) : x1
    x2 = x2 == :all ? Set(prs[!,:x2]) : x2
    x3 = x3 == :all ? Set(prs[!,:x3]) : x3

    res = filter(row -> row[:x1] in x1 && row[:x2] in x2 && row[:x3] in x3, prs)
        
    
    sum(res.P)

end

x1 = zeros(Int, 8); x1[5:end] .= 1
x2 = zeros(Int, 8); x2[[3,4,7,8]] .= 1
x3 = zeros(Int, 8); x3[2:2:end] .= 1

P =  [0.238, 0.042, 0.012, 0.108, 0.102, 0.018, 0.048, 0.432]

prs = DataFrame(x1= x1, x2 = x2, x3 = x3, P= P)

function argmax(p)
    i_max = 0; j_max = 0;
    p_max = 0
    for i in [0, 1]
        for j in [0, 1]
            println("P($i, $j) = ", p(i,j))
            if  p_max < p(i,j)
                p_max =p(i, j) 
                i_max, j_max = i, j
                
            end
        end
    end

    println(">>> P($i_max, $i_max) = ", p_max)
end
