load clown
image(X);colormap gray
[x,y]=ginput(1);
hold on;plot(x,y,'rp');hold off
X1=X;
%�s����W�n����y,x�̏��Ŏw�肷��B�܂��A�s��̃C���f�b�N�X�͏����_�Ŏw��s�̂���round�֐��Ȃǂŕϊ�����K�v����B
figure
X1(round(y),round(x))=255;image(uint8(cat(3,X1,X1,X1)));
