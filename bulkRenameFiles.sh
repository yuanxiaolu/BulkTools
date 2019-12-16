# rename file names to ordered ones
i=0
for file in `ls`; do i=$[$i+1]; newfile={prefix}$i\_{suffix}$i.jpeg; mv $file $newfile; echo $newfile; done;

# replace particular expr in file names
for file in `ls |grep 2017`; do newfile=`echo $file | sed 's/2017/2020/g'`; mv $file $newfile; done;

# insert prefix before file names
for file in `ls`; do newfile=`echo "{prefix}"$file`; mv $file $newfile; echo $newfile;done;

