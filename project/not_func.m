tic
k=.1;
D=.5;

xmin=0;
xmax=30;
ymin=0;
ymax=10;
h=.15625;
x=xmin:h:xmax;
y=ymin:h:ymax;
c=zeros(length(y),length(x));
c(:,1)=40;
c(end,end:-1:end-length(y)+1)=100;
rhs=c(:);
A=zeros(length(x)*length(y));

%
for i=1:length(y)
    A(i,i)=1;
end

for i=length(y)+1:length(y):length(A)-length(y)
    A(i,i+1)=2*D;
    A(i,i)=-(4*D+k*h^2);
    A(i,i-length(y))=D;
    A(i,i+length(y))=D;
end
for i=2*length(y):length(y):length(A)-length(y)
    A(i,i-1)=2*D;
    A(i,i)=-(4*D+k*h^2);
    A(i,i-length(y))=D;
    A(i,i+length(y))=D;
end
for i=length(y)+2:length(A)-length(y)
    if mod(i,length(y))~=0 && mod(i,length(y))~=1
        A(i,i-1)=D;
        A(i,i+1)=D;
        A(i,i)=-(4*D+k*h^2);
        A(i,i-length(y))=D;
        A(i,i+length(y))=D;
    end
end
A(length(A)-length(y)+1,length(A)-length(y)+1)=-(4*D+k*h^2);
A(length(A)-length(y)+1,length(A)-length(y)+2)=2*D;
A(length(A)-length(y)+1,length(A)-2*length(y)+1)=2*D;
for i=length(A)-length(y)+2:length(A)-1
    A(i,i)=-(4*D+k*h^2);
    A(i,i-length(y))=2*D;
    A(i,i-1)=D;
    A(i,i+1)=D;
end
for i=length(A):-length(y):length(A)-length(y)^2+1
    A(i,:)=zeros(1,length(A));
    A(i,i)=1;
end

c1=A\rhs;

c=reshape(c1,[length(y),length(x)]);

yf=flip(y);
[X,Y]=meshgrid(x,yf);
surf(X,Y,c)
toc