#import Base.sum
function sum(A::Assoc, dim::Int64)

    if(A.val != [1.0])
        A = logical(A)
    end

    if(dim == 1)
        return condense(Assoc(promote([1.0],A.row)[1],A.col, promote([1.0],A.val)[1],sparse(sum(A.A, dims = 1))))
    elseif (dim == 2)
    
        return condense(Assoc(A.row,promote([1.0],A.col)[1], promote([1.0],A.val)[1],sparse(sum(A.A, dims = 2))))
    end
end


function sum(A::Assoc)

    if(A.val != [1.0])
        A = logical(A)
    end
    
    sum(A.A)

end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

