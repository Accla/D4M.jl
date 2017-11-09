import Base.print

#=
print : print Assoc in a way that mimics the Sparse Array print.
=#
function print(A::Assoc)
    if !isempty(A)
        r,c,v = find(A)
        [size(A)...; length.(A.col)]

        padR = max(ndigits(size(A)[1]), length.(A.row)...)
        padC = max(ndigits(size(A)[2]), length.(A.col)...)

        println.("  [", rpad.(r, padR), ", ", rpad.(c , padC), "]  =  ", v)
    else
        show(A)
    end
    return nothing
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
#                    Lauren Milechin (lauren.milechin@mit.edu)
########################################################

