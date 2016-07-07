function Img_label=KFCM_Img(Img,Vinit,cluster_n,m,iter_max,e,delta)
% FCM(ģ��C��ֵ)�㷨
% ���������
%     Img--ԭͼ��
%     cluster_n--������
%     m--�����ȳ̶ȣ�default=2��
%     iter_max--������������default=1000��
%     e--ֹͣ��ֵ��default=1e-5��
% ���������
%     Img_label--ͼ������ǩ��1.2.3...��

if nargin==3
    m=2;iter_max=1000;e=1e-5;delta=10;
end
if nargin==4
    iter_max=1000;e=1e-5;delta=10;
end
if nargin==5
    e=1e-5;delta=10;
end
if nargin==6
    delta=10;
end
    
Img=double(Img);
[nrow,ncol]=size(Img);

%������ʼ��  
Img_reshape=reshape(Img,nrow*ncol,1);       %Դ����
options = [m;iter_max;e;1;delta]; 

%��ʼ����
[center,U,obj_fcn] = kfcm(Img_reshape,Vinit,options); 

%��ź͸�ԭͼ��
maxU = max(U);
maxUn=repmat(maxU,cluster_n,1);
U=U';
maxUn=maxUn';
One_index=(maxUn==U);

Img_label=zeros(size(Img_reshape));
for i=1:cluster_n
    index=floor(find(One_index(:,i)==1));
    Img_label(index)=i;
end

Img_label=reshape(Img_label,nrow,ncol);

%���ݻҶȼ����й�����
tmp=zeros(1,cluster_n);
for i=1:cluster_n
    tmp(i)=mean(Img(Img_label==i));
end 
[data,index]=sort(tmp);

Img_label0=zeros(size(Img_label));
for i=1:cluster_n
    Img_label0(Img_label==index(i))=i;
end

Img_label=Img_label0;
