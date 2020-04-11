function check=sample_check(sample, offset)
    treshold=0.3; %correlation
    corr=corrcoef(sample(1:length(sample)-offset),sample(offset+1:length(sample)));
    if corr(1,2)>treshold
        check=1;
    else
        check=0;
    end
end