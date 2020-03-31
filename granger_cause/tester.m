N = 50 ;                      % length of the series
max_lag   = 1;
max_x_lag =  max_lag;   use_best_x = 0 ;
max_y_lag =  max_lag;   use_best_y = 0 ;
firstYlag = 1 ;
alpha     = 0.05 ;
            
     
y = randn( N , 1);
x = randn( N , 1);  

[F,c_v] = granger_cause(x,y,alpha,max_lag);

if(F>c_v)
     fprintf('Causal');
 else
     fprintf('Not Granger Causal');
 end
 