%
% R. Boldi
% Zayed University, Dubai, UAE
% 2016
%
% test granger_cause_1 routine
% 
%  monte carlo simulation
% feed it a many random data sets
%
%       make histogram of Prob(F)  returned by granger_cause_1 
%       should be uniform  0 .. 1 distribution 
%
%
% R. Boldi -  July 2017
% Zayed University, UAE
%
clear all ;
close all ;


%
%
% define the model 
%
N = 50 ;                      % length of the series
max_lag   = 4;
max_x_lag =  max_lag;   use_best_x = 0 ;
max_y_lag =  max_lag;   use_best_y = 0 ;
firstYlag = 1 ;
alpha     = 0.05 ;
Ntrials = 1000 ; 


F_array = zeros(Ntrials,1);
P_array = zeros(Ntrials,1);
        
        for i = [ 1 : Ntrials ]
            

            
            x = randn( N , 1)         ;
            y = randn( N , 1)         ;
            
            %
            %
            %
            [  F , c_v ,   Fprob , Fprob_cor, dAIC,  dBIC  , best_x_lag , best_y_lag    ] = ...
                granger_cause_1(x, y,  alpha, max_x_lag , use_best_x, ...
                max_y_lag , use_best_y, firstYlag , ...
                'xName','yName', 0 , '.', 'Fprefix','Ptitle', 0 ) ;
            
            F_array(i)   = F ;
            P_array(i)  = Fprob ;
        
        end ; % nTrials
        
        
        
    
        figure;
        
        %
        % original granger_cuase
        %
        
        subplot(2, 1, 1 );
        
        hist(F_array, 50); hold all
        title('Distribution of F   ');
        text(0.0 , 1.20, sprintf('Granger cause 1;  N = %d  ; Ntrials = %d; xLag %d; yLag %d', ...
            N,  Ntrials, max_x_lag, max_y_lag ), 'units', 'normalized');
        
        xx = [ 0 1 ];
        yy = Ntrials/50;
        xlim=get(gca,'xlim');
        %plot( xlim, [yy yy],'Color','g','linewidth',2);
        xlabel('F');
        ylabel('No. of Occurences');
        
        set (gca, 'xminortick', 'on', 'yminortick', 'on'); grid('on');
        drawnow() ; refresh() ;
        
        %
        %   distribution of  F 
        %
        
        
        subplot( 2, 1, 2 );
        
    
        hist(P_array, 50); hold all;
        xx = [ 0 1 ];
        yy = Ntrials/50;
        xlim=get(gca,'xlim');
        line( xlim, [yy yy],'Color','g','linewidth',2);
        
        title('Distribution of Prob(F) ');
        xlabel('prob value returned');
        ylabel('No. of Occurences');
         
        set (gca, 'xminortick', 'on', 'yminortick', 'on'); grid('on');
        drawnow() ; refresh() ;
        

    
        strFN = sprintf('./granger_1_F_P_%03d', N );
        print(strFN,'-dpng' , '-r500') ;
        fprintf('%s\n', strFN);
        
        %
        
 

