# To get the list of the index and atom_lab
cif_file=$1
nhead=$2

echo "The cif file is: " $cif_file
echo "Number of header line: " $nhead

ntail=$(wc -l $cif_file |awk '{print $1}')
natom=$(($ntail - $nhead))
echo  "Total no of atoms: " $natom
tail -n $natom $cif_file |awk '{print $1}'> atom_lab.dat
if [ -f atom_index.dat ]
then
rm atom_index.dat
fi

for ((i=1; i<=$natom; i++))
do
  echo $i >> atom_index.dat
done
paste atom_index.dat  atom_lab.dat > atom_lable2.dat
