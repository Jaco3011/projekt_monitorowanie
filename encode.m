function out=encode(frame_length, track, message, offset)
    k=1; %Tells how much of the output is the added track
    if frame_length*length(message)>length(track)
        message=message(1:floor(length(track)/frame_length));
    end
    frame=zeros(frame_length,1);
    frame(offset+1:frame_length)=ones(frame_length-offset,1);
    to_encode=kron(message,frame);
    to_encode=[to_encode;zeros(length(track)-length(to_encode),1)];
    track_bis=[zeros(offset,1);track];
    track_bis=track_bis(1:length(track));
    track_bis=track_bis.*to_encode;
    out=track+k*track_bis;
    out=out.*(1-(k/(k+1))*to_encode);
end