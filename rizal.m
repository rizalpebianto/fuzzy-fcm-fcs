data = xlsread('data.xlsx', 'Sheet1');
%data_mU = xlsread('matriksU.xlsx', 'Sheet1');

options = [2 100 0.00001 1];
[pusat_cluster,U] = fcm(data,3,options);

numCluster = 3;
maxIter = 100;
U1 = cell(maxIter, 1);
for L = 1 : maxIter 
    [~ ,U1{L}, ~] = fcm(data, numCluster, options); 
end
maxU = max(U);
data_cluster1 = find(U(1,:) == maxU);
data_cluster2 = find(U(2,:) == maxU);
data_cluster3 = find(U(3,:) == maxU);

plot(data(data_cluster1,1),data(data_cluster1,2),'ob')
hold on
plot(data(data_cluster2,1),data(data_cluster2,2),'or')
plot(data(data_cluster3,1),data(data_cluster3,2),'og')
plot(pusat_cluster(1,1),pusat_cluster(1,2),'xb','MarkerSize',15,'LineWidth',3)
plot(pusat_cluster(2,1),pusat_cluster(2,2),'xr','MarkerSize',15,'LineWidth',3)
plot(pusat_cluster(3,1),pusat_cluster(3,2),'xg','MarkerSize',15,'LineWidth',3)
hold off
