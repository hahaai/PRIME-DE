#!/bin/sh

# EncryptForUpload.sh
# script to encrypt files 
# Written by: Ranjeet Khanuja, 2012 __Child Mind Institute__. 
# License type: Creative Commons, Attribution - non-commercial


file=$1
pass=$2
encrypt=_encrypted

#no of arguments
ARGS=2

if [ $# -ne "$ARGS" ]
then 
 echo "Usage: ./EncryptForUpload.sh <input file> <password>"
 echo "For AccessCode/password contact Michael Milham at Michael.Milham@childmind.org or Adriana Dimartino at Adriana.Dimartino@nyumc.org"
 exit 1
fi





filename=$(basename $file)
extension=${filename#*.}
filename=${filename%%.*}
dot=.
outfile=${filename}${encrypt}${dot}${extension}


#echo "openssl aes-256-cbc -a -salt -k $pass -in $file -out $outfile"
echo "encrypting $file"

echo \"$pass\"

openssl aes-256-cbc -a -salt -k $pass -in $file -out $outfile

#to decrypt
#openssl aes-256-cbc -d -a -in $outfile -out 

echo "done"
echo "The encrypted file is $outfile"

