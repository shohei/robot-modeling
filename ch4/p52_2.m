load clown
image(X);colormap gray
[x,y]=ginput(1);
hold on;plot(x,y,'rp');hold off
X1=X;
%行列座標系だとy,xの順で指定する。また、行列のインデックスは小数点で指定不可のためround関数などで変換する必要あり。
figure
X1(round(y),round(x))=255;image(uint8(cat(3,X1,X1,X1)));
