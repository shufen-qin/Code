function Population = DecompositionSelection(Global,Population,associate,Cosinemax)
% The decomposition-based method environmental selection
   
    np = length(Population);
    %% Normalization
    Obj = Population.objs;
    Obj = (Obj-repmat(min(Obj),np,1))./(repmat(max(Obj),np,1)-repmat(min(Obj),np,1));

    %% Select one solution for each reference vector
    list = unique(associate)';
    Next = zeros(length(list),1);
    t = 1;
    for i = list
        current = find(associate == i);
        dist = pdist2(Obj(current,:),zeros(1,Global.M),'Euclidean');
        Fan = Cosinemax(current)./dist;
        [~,best] = max(Fan);
        Next(t)  = current(best);
        t = t +1;
    end
    % Population for next generation
    Population = Population(Next);

end
