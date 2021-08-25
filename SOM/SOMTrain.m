%%
function W = SOMTrain(P,nh,epochs,lr)
% P is number of data X number of attribute (ndat*natb)
% lr is learning rate (default:0.1)

% initialitation
W=FirstWeightCent(P,nh);
% W=rand(size(P,2),nh);
% nh=size(W,2);

P=P';


tic;
figBar = waitbar(0,'','Name','Training in progress...',...
    'CreateCancelBtn',...
    'setappdata(gcbf,''cancelling'',1)');
setappdata(figBar,'cancelling',0);


nDat=size(P,2);
nInput=size(P,1);
nIter=0;
while (nIter<epochs)                                            %Start Epoch    
    nIter=nIter+1;                                              %a number iterasi add one
    for i=1:nDat                                               %Start Iterasi
        %Find winner of hidden
        dist=zeros(1,nh);
        for k=1:nInput
            dist=dist+power(minus(P(k,i),W(k,:)),2);
        end
        for j=1:nh
            if j==1
                minDist=dist(j);
                nj=1;
            elseif (j>1) && (dist(j)<minDist)
                minDist=dist(j);
                nj=j;
            end
        end
        %update weight between input and hidden layer
        W(:,nj)=W(:,nj)+lr*minus(P(:,i),W(:,nj));
    end
    lr = 0.5*lr;
    
    if getappdata(figBar,'cancelling')
        break
    end
    
    t = toc;
    perc = nIter/epochs;
    trem=t/perc-t; %Calculate the time remaining
    hours=floor(trem/3600);
    minutes=floor((trem-hours*3600)/60);
    waitbar(perc,figBar,...
        ['Time remaining : ' ...
        sprintf('%03.0f',hours) ':'...
        sprintf('%02.0f',minutes) ':'...
        sprintf('%02.0f',rem(trem,60))]);
    %sprintf('%0.1f',perc*100) '\%, '...
end
delete(figBar);
