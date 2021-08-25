%%
function class = SOMClass(W,P,msg,method)
P=P';
if nargin>2
waitbar(0,msg, 'DelayPeriod', 0, 'LingerPeriod', 0, ...
                'MinUpdateTime', 0, 'Name', method, 'BarColor', [0 1 0]);
end
nInput=size(P,1);
nDat=size(P,2);
nh=size(W,2);
class=zeros(nDat,1);
for i=1:nDat;                                               %Start Iterasi
    %Find winner of hidden
        dist=zeros(1,nh);
        for k=1:nInput
            dist=dist+power(minus(P(k,i),W(k,:)),2);
        end;
        for j=1:nh;
            if j==1;
                minDist=dist(j);
                nj=1;
            elseif (j>1) && (dist(j)<minDist);
                minDist=dist(j);
                nj=j;
            end;
        end;
    class(i)=nj;
if nargin>2
    waitbar(i/nDat);
end
end;