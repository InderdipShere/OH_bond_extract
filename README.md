# OH_bond_extract
This code extract the Hydrogen bond.

Rrequirement:  Using the lammps-interface the hydrogen bond of the interest was not accounted. Hence we wanted to add the H-bond.
The problem is that in the cif file the atoms are labled based on their multiplication (during the slab formation). That is there are 12 oxygen labelled O1 for multiplication of 12.
Using vesta we can find H-bond between O9-H2, but we don't really know their real index. 
This code generate the index of atoms forming H-bonds

It needs cif file (CAU11Al_347.cif)
>> ./extract_index_atomlab.sh  <cif_file > <no_head_lines> 
This generats file containing atom index (atom_lable2.dat) 

The second part is to extract the H-bond. 
The bonds in vesta at seen by atom label of H-bond. For example we get, O9-H2, O17-H30
In the extract_bond.sh we need to provide this information. 
---------
# to extract the bonds
beg_O=(9 17) #oxygen
end_O=(9 17)
beg_H=(2 30)  #hydrogen
end_H=(2 30)
--------
If there is the range of atom label, for example, H2 to H10, we can simply put beg_H(2) and end_H(10)
The atoms labels in the array should be according to the H-bonds. For example, O9-H2, the label of oxygen in beg_O(* * 9) is third place, then for all the array index should be three. end_H(* * 2)

>> ./extract_bond.sh
generates extract_bond.dat file that contains, atom index of H and O atoms 
