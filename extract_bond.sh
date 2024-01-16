# to extract the bonds
beg_O=(6 9 20 23) #oxygen
end_O=(6 9 20 23)
beg_H=(9 10 27 28)  #hydrogen
end_H=(9 10 27 28)

for A in O H
do  
   echo "Atom : " $A
   beg_name="beg_${A}[@]"
   beg=("${!beg_name}")
   end_name="end_${A}[@]"
   end=("${!end_name}")
   #declare -a beg=("beg_${A}[@]")
   #declare -a end=("end_${A}[@]")
   #beg=("${beg_"$A"[@]}")
   #end=("${end_"$A"[@]")
   bond_lab="bond_lab_"$A".dat"
   echo "bond lab file", $bond_lab
   echo "Array beg", "${beg[@]}"
   echo "Array end", "${end[@]}"

   rm $bond_lab

for ((j=0;j<${#beg[@]};j++));
do 
  star=${beg[j]}
  stop=${end[j]}
  echo "start stop", $star, $stop
  for ((i=star;i<=stop; i++))
  do 
    lab=$A$i
    #echo $lab
    grep  $lab atom_lable2.dat >> $bond_lab
  done
done 
done 



nbond=$(wc -l $bond_lab|awk '{print $1}')
echo "total no of bond ", $nbond
paste  bond_lab_H.dat bond_lab_O.dat | awk '{print $1, $3}' > extract_bond.dat
