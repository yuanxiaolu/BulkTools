BASE_PATH={workDir}
cd $BASE_PATH
TOTAL_NUM=`ls -l | grep "^-" | wc -l`
EACH_NUM=10000
FOLDER_NUM=$[$[$TOTAL_NUM/$EACH_NUM]+1]
echo $FOLDER_NUM
FILE_BASE_NAME="IT001-001-00000000.jpg"
FOLDER_BASE_NAME="IMAGE_10k_FOLDER_"

#create folders
#based on how many files you want to store in each folder
cd ..
for i in $(seq 1 $FOLDER_NUM);
do
    #mkdir ${BASE_PATH}/${FOLDER_BASE_NAME}${i} &
    mkdir ${FOLDER_BASE_NAME}${i} 
done

#copy files to each folder
for k in $(seq 0 $[$FOLDER_NUM-1]);
do
echo $k
    for i in $(seq $[$[$k*$EACH_NUM]+1] $[$[$k+1]*$EACH_NUM]); 
        do 
        INDEX=`printf "%08d\n" ${i}`
        echo IT001-001-${INDEX}.jpg
        #cp ${BASE_PATH}/IT001-001-${INDEX}.jpg ${BASE_PATH}/IMAGE_FOLDER_$[$k+1]/ & 
        cp ${BASE_PATH}/IT001-001-${INDEX}.jpg ./IMAGE_FOLDER_$[$k+1]/ & 
        done
done
