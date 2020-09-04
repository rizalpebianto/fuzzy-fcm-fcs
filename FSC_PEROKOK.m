clear; clc;

%PANGGIL DATA
data = xlsread('data.xlsx', 'Sheet1');

%INISIALISASI
nilai_awal = [1.5 0.5 0.1 1];
jari2 = 0.5;
MinMax = [0 0 0 ; 12 20 250000];

%PROSES FUZZY Subtractive Clustering
[pusat_cluster,S] = subclust(data, jari2, 'DataScale', MinMax, 'Options', nilai_awal);

%MENGHITUNG DERAJAT KEANGGOTAAN
matriks_u = zeros(18, 3);
for i=1:18
    for j=1:3
        matriks_u(i,j) = exp(-(((data(i,1) - pusat_cluster(j,1))^2)/(2*S(1,1)^2) + ((data(i,2) - pusat_cluster(j,2))^2)/(2*S(1,2)^2) + ((data(i,3) - pusat_cluster(j,3))^2)/(2*S(1,3)^2)));
    end
end

%PENGELOMPOKAN DATA BERDASARKAN CLUSTER
U = matriks_u()';
maxU = max(U);
data_cluster1 = find(U(1,:) == maxU);
data_cluster2 = find(U(2,:) == maxU);
data_cluster3 = find(U(3,:) == maxU);

%GAMBAR (PLOT) PUSAT CLUSTER DAN DATA
plot3(data(data_cluster1,1),data(data_cluster1,2),data(data_cluster1,3),'.b','MarkerSize',25)
title('Fuzzy Subtractive Clustering')
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


