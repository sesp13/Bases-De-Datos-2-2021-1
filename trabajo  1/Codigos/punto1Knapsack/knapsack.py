def knapSack(W, wt, val, n):
    K = [[0 for x in range(W + 1)] for x in range(n + 1)]
 
    # Build table K[][] in bottom up manner
    for i in range(n + 1):
        for w in range(W + 1):
            if i == 0 or w == 0:
                K[i][w] = 0
            elif wt[i-1] <= w:
                K[i][w] = max(val[i-1]
                          + K[i-1][w-wt[i-1]], 
                              K[i-1][w])
            else:
                K[i][w] = K[i-1][w]

    optimo = []
    i = n  
    j = W 
    while(True):
      print("i " , i)
      print("j " , j)
      aux1 = K[i][j] 
      aux2 = K[i-1][j] 

      if(aux1 == aux2):
        # No agrego
        i = i - 1
        j = j
      else: 
        optimo.append(wt[i-1])
        j = j - wt[i -1]
        i = i - 1
      
      print(optimo)
      
      if(i == 0):
        break

    return K[n][W]

# for i in range(10):
#   print(i)
 
 
# Driver code
# val = [60, 100, 120]
wt = [10, 20, 30]
W = 40
# n = len(val)
n = len(wt)
print(knapSack(W, wt, wt, n))