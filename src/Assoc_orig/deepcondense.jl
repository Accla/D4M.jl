
#=
deepCondense : remove empty mapping of row, column, and value, and return the condensed of the input Assoc.
=#
function deepCondense(A::Assoc)
    Anew = condense(A)
    row,col,val = findnz(Anew.A)
    uniVal = sort!(unique(val))
    val = Array{Int64,1}(pmap(x -> searchsortedfirst(uniVal,x), val))
    #At this point val is the mapping to uniVal
    #Anew.A = sparse(row,col,val)
    Anew = Assoc(copy(Anew.row),copy(Anew.col),copy(Anew.val[uniVal]),sparse(row,col,val))#putAdj(Anew,sparse(row,col,val))

    #= May not need this if using putAdj?
    if A.val == [1.0] #Checking if the A.val mapping needs to be done.
        Anew.val = Array{Union{AbstractString,Number},1}(uniVal)
    else
        uniVal = pmap(x -> Anew.val[x],uniVal)
        Anew.val = Array{Union{AbstractString,Number},1}(uniVal)
    end
    =#

    return Anew
    
end


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

