function [Vinit]=KFCM_init(Img,cluster_n)
% KFCM��ʼ���������õ���ʼ�������ģ�ʹ��K-means�㷨���г�ʼ��
% ���������
%         Img--ԭͼ��
%         cluster_n--������
% ���������
%         Vinit--��ʼ��������
%
%by--zou


Img=double(Img);
[row,col]=size(Img);
Imgtmp=reshape(Img,row*col,1);
[index,Vinit]=kmeans(Imgtmp,cluster_n,'emptyaction','singleton');
