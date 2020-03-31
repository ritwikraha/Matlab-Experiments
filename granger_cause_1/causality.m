N = 50 ;                      % length of the series
max_lag   = 1;
max_x_lag =  max_lag;   use_best_x = 0 ;
max_y_lag =  max_lag;   use_best_y = 0 ;
firstYlag = 1 ;
alpha     = 0.05 ;
            
     
y = randn( N , 1);
x = randn( N , 1);  
[  F , c_v ,   Fprob , Fprob_cor, dAIC,  dBIC  , best_x_lag , best_y_lag    ] = ...
                granger_cause_1(x, y,  alpha, max_x_lag , use_best_x, ...
                max_y_lag , use_best_y, firstYlag , ...
                'xName','yName', 0 , '.', 'Fprefix','Ptitle', 0 ) ;
            
 if(F>c_v)
     fprintf('Causal');
 else
     fprintf('Not Granger Causal');
 end
 