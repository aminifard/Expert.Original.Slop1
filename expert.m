clc
clear 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=input('Please enter the number of rows of matrix S:\n');
n=input('Please enter the number of columns of matrix S:\n');
d=input('Please enter the number of columns of matrix U:\n');
filename = 'Book1.xlsx';
sheet = 1;
xlRange = 'A4:C27651';
St = xlsread(filename,sheet,xlRange);
[M,N]=size(St);
s=zeros(m,n);
for i=1:M
    s(St(i,1),St(i,2))=St(i,3);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lt=xlsread(filename,'A43736:C59813');
[nl,ml]=size(Lt);
l1=zeros(n,d);
for i=1:nl
    l1(Lt(i,1),Lt(i,2))=Lt(i,3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ut=xlsread(filename,'A27655:C43732');
[nu,mu]=size(Ut);
u1=zeros(n,d);
for i=1:nu
    u1(Ut(i,1),Ut(i,2))=Ut(i,3);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
U=u1;
[n,d]=size(U);
f=[ones(1,n),zeros(1,n*d)];
lb = [zeros(n,1);reshape(L,[],1)];
ub = [inf*ones(n,1);reshape(U,[],1)];
Aeq=[zeros(m,n),repmat(S,1,d)];
beq=zeros(m,1);
A=[];
b=[];
bl=[];
gamma=0;
socConstraints=zeros(1,n);
for i=1:n
    a=zeros(1,n+n*d);
   
    D2=zeros(n+n*d,1);
       for k=1:d
           a(1,kn+i)=1;
       end
  a1=diag(a);
  D2(i)=1;
  
socConstraints(i)=secondordercone(a1,bl,D2,gamma);
end
[x,fval]=coneprog(f,socConstraints,A,b,Aeq,beq,lb,ub);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ntaye aval

v=reshape(x,n,d+1);
v(:,1)=[];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'output.xlsx';
A = [v];
xlswrite(filename,A);
