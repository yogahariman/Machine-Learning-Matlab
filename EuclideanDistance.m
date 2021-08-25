function x=EuclideanDistance(x,y)
%euclidean
for ii=1:length(y)
   x(:,ii)=(x(:,ii)-y(ii)).^2;
end
if size(x,2)>1,x=sum(x,2);end

x=sqrt(x);
