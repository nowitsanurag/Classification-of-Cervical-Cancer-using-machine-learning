load GLCM_FINAL_22_features.mat;
X= G;
[coeff,score1,latent,tsquared] = pca(X);

plot(score1(:,1),score1(:,2),'--r');
title('PCA plot for data')
xlabel('1st Principal Component')
ylabel('2nd Principal Component')