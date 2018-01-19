 clear;
 images    = cell(11,1);
 images{1} = imread('img001.jpg');
 images{2} = imread('img002.jpg');
 images{3} = imread('img003.jpg');
 images{4} = imread('img004.jpg');
 images{5} = imread('img005.jpg');
 images{6} = imread('img006.jpg');
 images{7} = imread('img007.jpg');
 images{8} = imread('img008.jpg');
 images{9} = imread('img009.jpg');
 images{10} = imread('img010.jpg');
 images{11} = imread('img011.jpg');
 images{12} = imread('img012.jpg');
 images{13} = imread('img013.jpg');
 images{14} = imread('img014.jpg');
%  create the video writer with 1 fps
 writerObj = VideoWriter('MoeVideo.avi');
 writerObj.FrameRate = 3; %Control the playing speed e.g. 1:1photo/sec, 10:10 photos/sec 
 % set the seconds per image
 secsPerImage = [1 1 1 1 1 1 1 1 1 1 1 1 1 1]; %No.1 = No. of images
 % open the video writer
 open(writerObj);
 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(images{u});
     for v=1:secsPerImage(u) 
         writeVideo(writerObj, frame);
     end
 end
 % close the writer object
 close(writerObj);

 