

n = 2 .^ [6 6 7 8 9 10 11 12]

MaxGB = 2
MaxGF = 4 * 1.6

m = n .^ 2
dense_gbytes = 2 * 8 * m ./ 1e9 
dense_flops = 2 * n .^ 3
dense_gflops = zeros(1,length(n))
dense_time = zeros(1,length(n))

for i = 1:length(n)

    global dense_gflops, dense_time

    A = rand(n[i],n[i])
    B = rand(n[i],n[i])

    dense_time[i] = @elapsed C = A*B

    dense_gflops[i] = dense_flops[i] ./ dense_time[i] ./ 1e9

    print("Time: ", string(dense_time[i],))
    print(", GFlops: ", string(dense_gflops[i]))
    println(", GBytes: ", string(dense_gbytes[i]))

end
