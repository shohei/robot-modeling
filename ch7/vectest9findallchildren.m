function ind=vectest9findallchildren(arm)
%�����N�\���̂̍\������͂��ăC���f�b�N�X�s����o�͂���B
%�}�����ꃊ���N�ɂ��Ή����邽�߁A�܂��Achildren��0�̖��[�̃C���f�b�N�X���W�߂�B
childidx=[];
for i=1:length(arm)
	if(arm(i).children == 0) childidx=[childidx i];end
end
%���[����e�ւ̃C���f�b�N�X��k��S�Ď��o���B
%��{�I�ɂ́A���f�[�^�ƂȂ邪�A�}�����ꂪ����ꍇ�ɂ́A�s��f�[�^�ƂȂ�A
%�����烋�[�g�C���f�b�N�X���X�^�[�g����B�s��ɂ��邽�߁A�C���f�b�N�X�̒���
%���قȂ�ꍇ�ɂ́A��Ԓ����C���f�b�N�X�ɍ��킹�f�[�^�������Ƃ����0�𖄂߂�B
ind=vectest9findparent(arm,childidx(1));
for i=childidx(2:end)
	tmpind=vectest9findparent(arm,i);
	if(length(ind(1,:))< length(tmpind)) ind(1,length(tmpind))=0;
	elseif (length(ind(1,:)) > length(tmpind)) tmpind(1,length(ind(1,:)))=0;
	end
	ind=[ind;tmpind];
end
%�����R�[���֐� i�C���f�b�N�X�̐e�����N�C���f�b�N�X�����֐�
function ind=vectest9findparent(arm,i)
ind=[];
for jj=1:length(arm);
	ind=[i,ind];
	i = arm(i).parent;
	if(i == 0) return;end;
end
