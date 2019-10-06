function ind=vectest9findallchildren(arm)
%リンク構造体の構造を解析してインデックス行列を出力する。
%枝分かれリンクにも対応するため、まず、childrenが0の末端のインデックスを集める。
childidx=[];
for i=1:length(arm)
	if(arm(i).children == 0) childidx=[childidx i];end
end
%末端から親へのインデックスを遡り全て取り出す。
%基本的には、横データとなるが、枝分かれがある場合には、行列データとなり、
%左からルートインデックスがスタートする。行列にするため、インデックスの長さ
%が異なる場合には、一番長いインデックスに合わせデータが無いところは0を埋める。
ind=vectest9findparent(arm,childidx(1));
for i=childidx(2:end)
	tmpind=vectest9findparent(arm,i);
	if(length(ind(1,:))< length(tmpind)) ind(1,length(tmpind))=0;
	elseif (length(ind(1,:)) > length(tmpind)) tmpind(1,length(ind(1,:)))=0;
	end
	ind=[ind;tmpind];
end
%内部コール関数 iインデックスの親リンクインデックスを作る関数
function ind=vectest9findparent(arm,i)
ind=[];
for jj=1:length(arm);
	ind=[i,ind];
	i = arm(i).parent;
	if(i == 0) return;end;
end
