function LMOEADS(Global)
% <algorithm> <L>
% Large-scale evolutionary multi-objective optimization assisted by
% directed sampling.
% Nw  --- 10 --- Cluster number
% Ns  --- 30 --- The number of random sampling along each guiding direction

%------------------------------- Reference --------------------------------
% S. Qin, C. Sun*, Y. Jin*, Y. Tan and J. Fieldsend, "Large-scale 
% Evolutionary Multi-objective Optimization Assisted by Directed Sampling,"
% in IEEE Transactions on Evolutionary Computation, 
% doi: 10.1109/TEVC.2021.3063606.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

% This function is written by Shufen Qin, e-mail:
% shufen.qin@stu.tyust.edu.cn

    %% Parameter settings
    [Nw,Ns] = Global.ParameterSet(10,30);
    
    %% Initialization
    Population  = Global.Initialization();
    [RefV,~]    = UniformPoint(Global.N,Global.M);
    
    %% Optimization
    while Global.NotTermination(Population)
        GuidingSolution = DirectedSampling(Global,Population,Ns,Nw,RefV);
        Population      = DoubleReproduction(Global,Population,GuidingSolution,RefV);
   end 
end
