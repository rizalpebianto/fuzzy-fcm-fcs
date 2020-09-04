%PANGGIL DATA
data = xlsread('data.xlsx', 'Sheet1');

%TENTUKAN NILAI AWAL
inisialisasi = [2 100 1e-5 1];

%PROSES CLUSTERING 
[pusat_cluster, U, obj_fcn] = fcm_modif(data, 3, inisialisasi);

%PENGELOMPOKAN DATA BERDASARKAN CLUSTER
maxU = max(U);
data_cluster1 = find(U(1,:) == maxU);
data_cluster2 = find(U(2,:) == maxU);
data_cluster3 = find(U(3,:) == maxU);

%GAMBAR (PLOT) PUSAT CLUSTER DAN DATA
plot3(data(data_cluster1,1),data(data_cluster1,2),data(data_cluster1,3),'.b','MarkerSize',25)
title('Fuzzy C-Means Clustering')
xlabel('Jumlah rokok (/hari)')
hold on
ylabel('Mulai merokok umur?')
zlabel('Biaya (/bulan)')
plot3(data(data_cluster2,1),data(data_cluster2,2),data(data_cluster2,3),'.r','MarkerSize',25)
plot3(data(data_cluster3,1),data(data_cluster3,2),data(data_cluster3,3),'.g','MarkerSize',25)
grid on
CLUSTER_1 = plot3(pusat_cluster(1,1),pusat_cluster(1,2),pusat_cluster(1,3),'xb','MarkerSize',15,'LineWidth',3);
CLUSTER_2 = plot3(pusat_cluster(2,1),pusat_cluster(2,2),pusat_cluster(2,3),'xr','MarkerSize',15,'LineWidth',3);
CLUSTER_3 = plot3(pusat_cluster(3,1),pusat_cluster(3,2),pusat_cluster(3,3),'xg','MarkerSize',15,'LineWidth',3);
legend([CLUSTER_1,CLUSTER_2,CLUSTER_3],'Cluster 1','Cluster 2','Cluster 3');
hold off
