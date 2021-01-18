   load ('pca_feature_selection.mat')
   data = q;  
    trainset=[data(1:56,:);data(62:91,:);data(97:171,:);data(177:196,:);data(202:223,:)];
    testset=[data(57:61,:);data(92:96,:);data(172:176,:);data(197:201,:);data(224:228,:)];
        % image 1-56 : allergic, 62-91 : bacterial, 97-171 : normal, 177-196 : viral
        % image 202-223 : normal red
class=zeros(1,203);
class(1,1:56)=1; % sending all data related to trainset of allergic to class1
class(1,57:96)=2; %sending all data related to trainset of bacterial to class2
class(1,97:171)=3; %sending all data related to trainset of normal eyes to class3
class(1,172:191)=4; %sending all data related to trainset of viral to class4
class(1,192:203)=5;%sending all data related to trainset of normal red eyes to class5
result = multisvm(trainset, class, testset);
counter=1;
for k=1:length(result)
    switch result(k)
        case 1
            expression=1;  %allergic
        case 2
            expression=2;   %bacterial
        case 3
            expression=3;   %normal eye
        case 4
            expression=4;    %viral
        case 5
            expression=5;    %normalred
        
    end
    t1{counter}=expression;
    counter=counter+1;

end
output=zeros(5,25);
for l1=1:25
    output(t1{l1},l1)=1;
end
target = zeros(5,25);
target(1,1:5) = 1;
target(2,6:10) = 2;
target(3,11:15) = 3;
target(4,16:20) = 4;
target(5,20:25) = 5;
plotconfusion(target,output)