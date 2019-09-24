%��������
D = load('all.mat');
% zeros = [10,1];
pcost = [];%ÿ�����ӵ�Ŀ�꺯�����ֵ
pbest = [];%�������Ų���
for i=1:10
    particle_cost = D.particle(i).Cost;
    particle_position = D.particle(i).Position;
    pcost = [pcost;particle_cost];
    pbest = [pbest;particle_position];
    i = i+1;
end
pcost(cellfun(@isempty,pcost))=[];
pbest(cellfun(@isempty,pbest))=[];

pcost = reshape(cell2mat(pcost),[10,112]);%���������ֵ
pbest = reshape(pbest,[10,112]);

[min_pcost,index]=min(pcost,[],2);%����С��ȣ����Ž⣩����λ��

row = [1,2,3,4,5,6,7,8,9,10];
column = [];
for i=1:10
    column = [column,index(i)];
    i=i+1;
end
pbest = pbest(row+(column-1)*size(pbest,1));%�������ó�ÿ�����ӵ����Ų������
pbest = cell2mat(pbest);
pbest = (reshape(pbest,[4,10]))';
pbest = [pbest,min_pcost];%��������ȶ�Ӧ�ϲ�

%���������̵����Ž���ȡ����
gbindex = D.outputiterop;
gbest=[];
bcost = D.BestCost;
bcost(find(bcost==0))=[];%ȥ����Ԫ��
iteration = size(bcost,1);
for i=1:iteration
    if i == 1
        j = gbindex(1,1);
        gbest = [gbest,D.particle(j).Position(i+1)];
    end
    if i~=1
        if D.BestCost(i) ~= D.BestCost(i-1)
            j = gbindex(i,1);
            gbest = [gbest,D.particle(j).Position(i+1)];
        end
        if D.BestCost(i) == D.BestCost(i-1)
           gbest = [gbest,gbest(i-1)];
        end
    end 
end
