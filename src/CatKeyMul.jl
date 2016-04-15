function CatKeyMul(A::Assoc,B::Assoc)
    if isa(Col(A)[1],AbstractString) && isa(Row(B)[1],AbstractString)

##Target = Tousandth GFlops performance



    #= Approach #2 Ten-thousandth GFlops performance
        AB = logical(A)*logical(B);
        A1 = A[Row(AB),:];  B1 = B[:,Col(AB)];
        A2 = A1[:,Row(B1)]; B2 = B1[Col(A1),:];
        A2size = size(Adj(A2));  B2size = size(Adj(B2));

        A2adj = Adj(A2);
        A2col = Col(A2);

        B2adj = Adj(B2);
        
        rrr,ccc,~ = findnz(Adj(AB))
        v = Array{Array{Union{AbstractString,Number},1},1}()
#        vvv = Array(Union{AbstractString,Number}, length(rrr))
        vvv = Array{Union{AbstractString,Number},1}()
        RowB = Row(B)
        currIndex = 0;
        for i = 1:B2size[2]
            potentialvv, ~, ~  = findnz(B2adj[:,i])
            X = A2adj[:,potentialvv] #reduce to just the potential for this column from B
            rr,~,~ =  findnz(sum(X,2))  #sort!(unique(X.rowval ))
            vv = [ potentialvv[X[i,:]'.rowval] for i = rr] #Get the mapping from VV to column
            #cc = repmat([i],length(rr),1)
            vv = [join(v,";")*";" for v = vv]
 #           vvv[(1+currIndex):(currIndex+size(vv,1) )]  = vv
            vvv = [vvv;vv]
            currIndex += size(vv,1)
        end
        vKey = sort(unique(vvv))
        vvv= [searchsortedfirst(vKey,v) for v in vvv]
        println(size(rrr,1));
        println(size(ccc,1));
        println(size(vvv,1));

 
        AB.A = sparse(rrr,ccc,vvv)
        AB.val = vKey
=#

#=  Approach #1 Ten-Thousandth GFlops performance
        AB = A*B
        A1 = A[Row(AB),:]
        B1 = B[:,Col(AB)]
        A  = A1[:,Row(B1)]
        B  = B1[Col(A1),:]
        rrr,ccc,~ = findnz(Adj(AB))
        ABVal = Array(Union{AbstractString,Number},length(rrr))
        AA = Adj(A)
        BA = Adj(B)
        RowA2Cols = [ AA[i,:]'.rowval for i = 1:AA.m]
        RowB = Row(B)
        RowA = Row(A)
        ColB = Col(B)
        c = 1
        ColB2Rows =  BA[:,c].rowval
        for i in 1:length(rrr)
            r = rrr[i]
            if(c != ccc[i])
                c = ccc[i]
                ColB2Rows =  BA[:,c].rowval
            end
            ABvalList = sortedintersect(RowA2Cols[r],ColB2Rows)
            val = join(RowB[ABvalList],";")*";"
            ABVal[i] = val
        end
        AB.val = ABVal
        =#
        return AB
    else
        return A*B
    end
    

end
