#import Base.transpose

#=
 transpose : return the transpose of Given Assoc
=#

function transpose(A::Assoc)
    return Assoc(A.col,A.row,A.val,Transpose(A.A))
end

function adjoint(A::Assoc)
    return Assoc(A.col,A.row,A.val,Adjoint(A.A))
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

