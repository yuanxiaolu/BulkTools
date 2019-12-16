cd {workDir}
TOTAL_NUM=`ls -l | grep "^-" | wc -l`
EACH_NUM=1000
FOLDER_NUM=$[$[$TOTAL_NUM/$EACH_NUM]+1]
echo $FOLDER_NUM
FILE_BASE_NAME="IT001-001-00000000.jpg"
FOLDER_BASE_NAME="IMAGE_FOLDER_"

#for i in $(seq 1 $FOLDER_NUM);
#do
#    mkdir {workDir}/${FOLDER_BASE_NAME}${i} &
#done

for k in $(seq 0 $[$FOLDER_NUM-1]);
do
echo $k
    for i in $(seq $[$[$k*$EACH_NUM]+1] $[$[$k+1]*$EACH_NUM]); 
        do 
        #echo $i 
        INDEX=`printf "%08d\n" ${i}`
        echo IT001-001-${INDEX}.jpg
        cp {workDir}/formatted/IT001-001-${INDEX}.jpg {workDir}/IMAGE_FOLDER_$[$k+1]/ &
        done
#echo $k
done
