function [message,original_track]=decode(frame_length, track, offset)
    n_of_bits=floor(length(track)/frame_length);
    message=zeros(n_of_bits,1);
    for ii=1:n_of_bits
        message(ii)=sample_check(track(frame_length*(ii-1)+1:frame_length*ii),offset);
    end
    original_track=0;
end